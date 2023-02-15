#include "tcp_connection.hh"

#include <iostream>

// Dummy implementation of a TCP connection

// For Lab 4, please replace with a real implementation that passes the
// automated checks run by `make check`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

void TCPConnection::unclean_shutdown(bool rst) {
	_active = false;
	_receiver.stream_out().set_error();
	_sender.stream_in().set_error();
	if (rst) {
		_sender.send_empty_segment(true);
	}
}

size_t TCPConnection::remaining_outbound_capacity() const { 
	return _sender.stream_in().remaining_capacity();
}

size_t TCPConnection::bytes_in_flight() const { 
	return _sender.bytes_in_flight();
}

size_t TCPConnection::unassembled_bytes() const { 
	return _receiver.unassembled_bytes();
}

size_t TCPConnection::time_since_last_segment_received() const { 
	return _now_time_ms - _last_segment_received_time_ms;
}

void TCPConnection::segment_received(const TCPSegment &seg) {
	if (!_active) {
		return;
	}
	_last_segment_received_time_ms = _now_time_ms;
	auto state = TCPState(_sender, _receiver, _active, _linger_after_streams_finish);
	if (state == TCPState::State::SYN_SENT && seg.header().ack) {
		// data segment with acceptable acks should be ignored in syn_sent
		if (seg.payload().size() > 0) {
			return;
		}
		auto ab_ackno = unwrap(seg.header().ackno, _sender.isn(), 0);
		if (ab_ackno != 1) {
			unclean_shutdown(true);
			return;
		}
	}
	if (state == TCPState::State::LISTEN && seg.header().ack) {
		unclean_shutdown(true);
		return;
	}
	bool send_empty = false;
	if (seg.header().rst) {
		//RST segments without ACKs should be ignored in syn
		if (state == TCPState::State::SYN_SENT && !seg.header().ack) {
			return;
		}
		unclean_shutdown(false);
		return;
	}
	if(!_receiver.segment_received(seg)) {
		send_empty = true;
	}
	if (seg.header().ack) {
		if(!_sender.ack_received(seg.header().ackno, seg.header().win)) {
			send_empty = true;
		}
	}
	if (_receiver.stream_out().eof() && !_sender.stream_in().eof()) {
		_linger_after_streams_finish = false;
	}
	if (seg.length_in_sequence_space() > 0) {
		send_empty = true;
	}
	if (send_empty) {
		_sender.send_empty_segment();
	}
}

bool TCPConnection::active() const {
	return _active;
}

size_t TCPConnection::write(const string &data) {
    size_t len = _sender.stream_in().write(data);
	_sender.fill_window();
	return len;
}

//! \param[in] ms_since_last_tick number of milliseconds since the last call to this method
void TCPConnection::tick(const size_t ms_since_last_tick) { 
	_now_time_ms += ms_since_last_tick;
	_sender.tick(ms_since_last_tick);
	if (_sender.consecutive_retransmissions() > TCPConfig::MAX_RETX_ATTEMPTS) {
		unclean_shutdown(true);
	}
}

void TCPConnection::end_input_stream() {
	_sender.stream_in().end_input();
	_sender.fill_window();
}

void TCPConnection::connect() {
	_sender.fill_window();
}

TCPConnection::~TCPConnection() {
    try {
        if (active()) {
            cerr << "Warning: Unclean shutdown of TCPConnection\n";

            // Your code here: need to send a RST segment to the peer
        }
    } catch (const exception &e) {
        std::cerr << "Exception destructing TCP FSM: " << e.what() << std::endl;
    }
}
