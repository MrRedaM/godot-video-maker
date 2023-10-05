class_name Sequence
extends Node


signal sequence_started()
signal sequence_finished()

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
		get_tree().create_timer(event.duration).timeout.connect(func(): event.event_finished.emit())
		event.start_event()
		event_idx += 1
		if event_idx < events.size() and events[event_idx].start_mode == Event.StartMode.WITH_PREVIOUS:
			start_next_event()
		elif event_idx < events.size() and events[event_idx].start_mode == Event.StartMode.AFTER_PREVIOUS:
			await event.event_finished
			start_next_event()
		if event_idx >= events.size():
			for e in events:
				if not e.finished:
					await e.event_finished
			sequence_finished.emit()
		return true
	else:
		sequence_finished.emit()
	return false
