#include "tcp_receiver.hh"

// Dummy implementation of a TCP receiver

// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

void TCPReceiver::segment_received(const TCPSegment &seg) {
	if (seg.header().syn) {
		_isn = seg.header().seqno;
	}
	if (_isn.has_value()) {
		uint64_t index = unwrap(seg.header().seqno, _isn.value(), _reassembler.reassembled_index());
		if (seg.header().syn) index += 1;
		_reassembler.push_substring(std::string(seg.payload().str()), index - 1, seg.header().fin);	
	}
	
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
