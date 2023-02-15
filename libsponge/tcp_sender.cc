#include "tcp_sender.hh"

#include "tcp_config.hh"

#include <random>

// Dummy implementation of a TCP sender

// For Lab 3, please replace with a real implementation that passes the
// automated checks run by `make check_lab3`.

template <typename... Targs>
void DUMMY_CODE(Targs &&... /* unused */) {}

using namespace std;

//! \param[in] capacity the capacity of the outgoing byte stream
//! \param[in] retx_timeout the initial amount of time to wait before retransmitting the oldest outstanding segment
//! \param[in] fixed_isn the Initial Sequence Number to use, if set (otherwise uses a random ISN)
TCPSender::TCPSender(const size_t capacity, const uint16_t retx_timeout, const std::optional<WrappingInt32> fixed_isn)
    : _isn(fixed_isn.value_or(WrappingInt32{random_device()()}))
    , _initial_retransmission_timeout{retx_timeout}
	, _retransmission_timeout(_initial_retransmission_timeout)
    , _stream(capacity) {}

size_t TCPSender::bytes_in_flight() const { 
	return _bytes_in_flight;
}

void TCPSender::fill_window() {
	while(true) {
		if (stream_in().eof() && _next_seqno == stream_in().bytes_written() + 2) {
			return;
		}
		auto window_left = unwrap(window[0], _isn, _next_seqno);
		auto window_right = unwrap(window[1], _isn, _next_seqno);
		if (window_right == window_left) {
			window_right += 1;
		}
		if (_next_seqno >= window_right) {
			return;
		}
		size_t len = window_right - _next_seqno;
		int num = 0;
		TCPSegment segment;
		segment.header().seqno = wrap(_next_seqno, _isn);
		if (_next_seqno == 0) {
			num += 1;
			segment.header().syn = true;
		}
		if (stream_in().input_ended() && min(len, TCPConfig::MAX_PAYLOAD_SIZE + num + 1) >= _stream.buffer_size() + num + 1) {
			num += 1;
			segment.header().fin = true;
		}
		if (num != 0 || !stream_in().buffer_empty()) {
			size_t payload_size = 0;
			if (len > static_cast<size_t>(num) && !stream_in().buffer_empty()) {
				std::string temp = stream_in().read(min(len - num, TCPConfig::MAX_PAYLOAD_SIZE));
				payload_size = temp.length();
				segment.payload() = Buffer(std::move(temp));
			}
			_next_seqno = _next_seqno + num + payload_size;
			outstanding_pushback(segment);	
			segment_out_push(segment);
		} else {
			break;
		}
	}
}

//! \param ackno The remote receiver's ackno (acknowledgment number)
//! \param window_size The remote receiver's advertised window size
bool TCPSender::ack_received(const WrappingInt32 ackno, const uint16_t window_size) {
	uint16_t ws = window_size;
	auto absolute_ackno = unwrap(ackno, _isn, _last_absolute_ackno);
	// out of window, invalid ackno
	if (absolute_ackno > _next_seqno) {
		return false;
	}
	if (absolute_ackno > _last_absolute_ackno) {
		_last_absolute_ackno = absolute_ackno;
		_retransmission_time = 0;
		_retransmission_timeout = _initial_retransmission_timeout;
		_retransmission_count = 0;
	}
	auto old_window_right = unwrap(window[1], _isn, _next_seqno);
	window[0] = ackno;
	window[1] = ackno + ws;
	auto window_left_index = unwrap(window[0], _isn, _next_seqno);
	while (!_outstanding_segments.empty()) {
		auto front = _outstanding_segments.front();
		auto index1 = unwrap(front.header().seqno, _isn, _next_seqno);
		if (index1 + front.length_in_sequence_space() <= window_left_index) {
			outstanding_popfront();
		} else {
			break;
		}
	}
	if (window_left_index + window_size > old_window_right) {
		fill_window();
	}
	return true;
}

//! \param[in] ms_since_last_tick the number of milliseconds since the last call to this method
void TCPSender::tick(const size_t ms_since_last_tick) {
	_retransmission_time += ms_since_last_tick;
	if (_retransmission_time >= _retransmission_timeout) {
		bool flag = false;
		if (!_outstanding_segments.empty()) {
			segment_out_push(_outstanding_segments.front());
			flag = true;
		}
		auto left = unwrap(window[0], _isn, _next_seqno);
		auto right = unwrap(window[1], _isn, _next_seqno);
		//window size is nonzero
		if (flag && right > left) {
			_retransmission_count += 1;
			_retransmission_timeout *= 2;
		}
		_retransmission_time = 0;
	}
}

unsigned int TCPSender::consecutive_retransmissions() const { 
	return _retransmission_count; 
}

void TCPSender::send_empty_segment(bool rst) {
	TCPSegment segment;
	if (rst) {
		segment.header().rst = true;
	}
	segment.header().seqno = wrap(_next_seqno, _isn);
	segment_out_push(segment);
}
