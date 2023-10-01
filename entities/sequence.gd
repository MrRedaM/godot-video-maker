class_name Sequence
extends Node


signal sequence_started(sequence)
signal sequence_finished(sequence)

@export
var events : Array[Event]

var event_idx : int = 0


func start_sequence():
	if await start_next_event():
		sequence_started.emit()


func start_next_event() -> bool:
	if event_idx < events.size():
		var event = events[event_idx]
		await get_tree().create_timer(event.delay).timeout
		event.start_event()
		event_idx += 1
		if event_idx < events.size() and events[event_idx].start_mode == Event.StartMode.WITH_PREVIOUS:
			start_next_event()
		elif event_idx < events.size() and events[event_idx].start_mode == Event.StartMode.AFTER_PREVIOUS:
			await event.event_finished
			start_next_event()
		return true
	return false

