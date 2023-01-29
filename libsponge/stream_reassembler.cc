#include "stream_reassembler.hh"

#include <cstddef>
#include <vector>

//: Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`

template <typename... Targs>
void DUMMY_CODE(Targs &&.../* unused */) {}

using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity) : _output(capacity), _capacity(capacity), _segments() {}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const std::string &data, const uint64_t index, const bool eof) {
    if (eof) {
        if (_has_eof_input == false) {
            _has_eof_input = true;
        }
        if (index + data.length() > _stream_all_length) {
            _stream_all_length = index + data.length();
        }
    }
    if (index < static_cast<uint64_t>(_reassembled_index)) {
        if (index + data.length() <= static_cast<uint64_t>(_reassembled_index)) {
            return;
        }
        return push_substring(data.substr(_reassembled_index - index), _reassembled_index, eof);
    }
	if (index + data.size() > _reassembled_index - _output.buffer_size() + _capacity) {
		int len = index + data.size() - _reassembled_index + _output.buffer_size() - _capacity;
		return push_substring(data.substr(0, data.length() - len), index, eof);
	}
    push(index, data);
    merge();
    // send to bytestream
    if (_segments.size() > 0) {
        auto seg = _segments.begin();
        if (seg->first == _reassembled_index) {
            size_t len = _output.write(seg->second);
            if (len == seg->second.size()) {
                _unreassembled_size -= seg->second.length();
            } else if (len < seg->second.size()) {
                _unreassembled_size -= len;
                _segments[seg->first + len] = seg->second.substr(len);
            }
            _segments.erase(seg);
            _reassembled_index += len;
        }
    }
    if (_has_eof_input && static_cast<size_t>(_reassembled_index) >= _stream_all_length) {
        _output.end_input();
    }
}

size_t StreamReassembler::push(uint64_t index, const std::string str) {
    if (str.length() <= 0) {
        return 0;
    }
    auto right = _segments.lower_bound(index);
    if (right == _segments.end()) {
        auto last = _segments.rbegin();
        if (last == _segments.rend() || static_cast<uint64_t>(index) >= last->first + last->second.length()) {
            size_t len = str.length();
            if (len > left_capacity()) {
                len = left_capacity();
            }
            _segments[index] = str.substr(0, len);
            _unreassembled_size += len;
            return len;
        }
        if (index + str.length() < last->first + last->second.length()) {
            return 0;
        }
        return push(last->first + last->second.length(), str.substr(last->first + last->second.length() - index));
    } else if (index == right->first) {
        if (str.length() < right->second.length()) {
            return str.length();
        }
        return right->second.length() + push(right->first + right->second.length(), str.substr(right->second.length()));
    } else {
        auto left = right;
        if (left != _segments.begin()) {
            left--;
            uint64_t left_rpos = left->first + left->second.length();
            if (left_rpos > index) {
                uint64_t len = left_rpos - index;
                if (len >= str.length()) {
                    return str.length();
                }
                return len + push(left_rpos, str.substr(len));
            }
        }
        int len = str.length();
        if (index + len <= right->first) {
            if (len > static_cast<int>(left_capacity())) {
                clear_tail(right->first, len - static_cast<int>(left_capacity()));
                len = left_capacity();
            }
            _segments[index] = str.substr(0, len);
            _unreassembled_size += len;
            return len;
        } else {
            if (right->first - index > left_capacity()) {
                clear_tail(right->first, right->first - index - left_capacity());
                len = right->first - index;
                if (len > static_cast<int>(left_capacity())) {
                    len = left_capacity();
                    _segments[index] = str.substr(0, len);
                    _unreassembled_size += len;
                    return len;
                }
            }
            _segments[index] = str.substr(0, right->first - index);
            _unreassembled_size += right->first - index;
            return right->first - index + push(right->first, str.substr(right->first - index));
        }
    }
    return -1;
}

void StreamReassembler::merge() {
    bool merged = true;
    while (merged) {
        if (_segments.size() <= 1) {
            return;
        }
        merged = false;
        auto left = _segments.begin();
        while (left != _segments.end()) {
            auto right = left;
            right++;
            if (left->first + static_cast<int>(left->second.length()) == right->first) {
                left->second += right->second;
                _segments.erase(right);
                merged = true;
                break;
            }
            left++;
        }
    }
}

size_t StreamReassembler::clear_tail(int left_border, size_t size) {
    size_t deleted_size = 0;
    vector<int> arr;
    bool has_done = false;

    for (auto it = _segments.rbegin(); it != _segments.rend(); it++) {
        if (static_cast<int>(it->first + it->second.length()) < left_border) {
            break;
        }
        size_t lend = it->second.length();
        if (size - deleted_size < lend) {
            lend = size - deleted_size;
            has_done = true;
        }
        if (static_cast<int>(it->first + it->second.length() - lend) < left_border) {
            lend = it->first + it->second.size() - left_border;
            has_done = true;
        }

        if (lend < it->second.length()) {
            _segments[it->first] = it->second.substr(0, it->second.length() - lend);
        } else {
            arr.push_back(it->first);
        }
        deleted_size += lend;
        if (has_done) {
            break;
        }
    }
    for (auto d : arr) {
        _segments.erase(d);
    }
    _unreassembled_size -= deleted_size;
    return deleted_size;
}

size_t StreamReassembler::unassembled_bytes() const { return _unreassembled_size; }

bool StreamReassembler::empty() const { return unassembled_bytes() == 0; }

size_t StreamReassembler::left_capacity() const { return _capacity - _output.buffer_size() - _unreassembled_size; }
