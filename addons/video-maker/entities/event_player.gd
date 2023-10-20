class_name EventPlayer


signal started()
signal finished()

var _event_idx := 0
var _sequence : Sequence
var _events : Array[Event]


func _init(sequence:Sequence, events: Array[Event]):
	_sequence = sequence
	_events = events
	init_events()


func play():
	_event_idx = 0
	reset_events()
	if await start_next_event():
		started.emit()


func init_events():
	for event in _events:
		if event:
			event.init(_sequence)


func reset_events():
	for event in _events:
		if event:
			event.reset()


func start_next_event() -> bool:
	if _event_idx < _events.size():
		var event = _events[_event_idx]
		await _sequence.get_tree().create_timer(event.delay).timeout
		event.start_event()
		_event_idx += 1
		if _event_idx < _events.size() and _events[_event_idx].start_mode == Event.StartMode.WITH_PREVIOUS:
			start_next_event()
		elif _event_idx < _events.size() and _events[_event_idx].start_mode == Event.StartMode.AFTER_PREVIOUS:
			await event.event_finished
			start_next_event()
		if _event_idx >= _events.size():
			for e in _events:
				if not e.finished:
					await e.event_finished
			finished.emit()
		return true
#	else:
#		finished.emit()
	return false
