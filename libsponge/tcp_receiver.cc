#include "tcp_receiver.hh"

// Dummy implementation of a TCP receiver

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

bool TCPReceiver::segment_received(const TCPSegment &seg) {
	if (seg.length_in_sequence_space() == 0) {
		return true;
	}
	if (seg.header().syn) {
		if (_syn_flag) {
			return false; //already get a syn, refuse other syn	
		}
		_syn_flag = true;
		_isn = seg.header().seqno;
	} else if (!_syn_flag) {
		return false; //before get a syn, refuse any segments
	}

	if (seg.header().fin) {
		if (_fin_flag) {
			return false;
		}
		_fin_flag = true;
	}
	uint64_t ab_seqn = unwrap(seg.header().seqno, _isn.value(), _reassembler.reassembled_index());
	int num = _reassembler.stream_out().eof() ? 1 : 0;
	if (ab_seqn >= _reassembler.window_right() + 1 || ab_seqn + seg.length_in_sequence_space() <= _reassembler.reassembled_index() + 1 + num) {
		return false;
	}
	if (_isn.has_value()) {
		uint64_t index = unwrap(seg.header().seqno, _isn.value(), _reassembler.reassembled_index());
		if (seg.header().syn) index += 1;
		_reassembler.push_substring(std::string(seg.payload().str()), index - 1, seg.header().fin);	
	}
	return true;
}

optional<WrappingInt32> TCPReceiver::ackno() const { 
	if (!_isn.has_value()) {
		return {};
	}
	uint64_t index = _reassembler.reassembled_index() + 1; 
	if (_reassembler.stream_out().input_ended()) {
		index += 1;
	}
	return wrap(index , _isn.value());
}

size_t TCPReceiver::window_size() const { 
	return _reassembler.left_capacity() + _reassembler.unassembled_bytes();
}
