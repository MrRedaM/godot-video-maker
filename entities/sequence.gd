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
		event.event_started.connect(_on_event_started.bind(event))
		event.start_event()
		event_idx += 1
		if event_idx == events.size():
			sequence_finished.emit(self)
		return true
	else:
		return false


func _on_event_started(event: Event):
	var next_event = _get_next_event()
	if not next_event:
		return
	if next_event.start_mode == Event.StartMode.WITH_PREVIOUS:
		start_next_event()
	elif next_event.start_mode == Event.StartMode.AFTER_PREVIOUS:
		var current_event = _get_current_event()
		current_event.event_finished.connect(_on_event_finished.bind(current_event))


func _on_event_finished(event: Event):
	start_next_event()


func _get_current_event() -> Event:
	if event_idx < events.size():
		return events[event_idx]
	else:
		return null


func _get_next_event() -> Event:
	if event_idx < events.size() - 1:
		return events[event_idx + 1]
	else:
		return null

