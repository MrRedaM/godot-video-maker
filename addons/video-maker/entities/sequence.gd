class_name Sequence
extends Node


signal sequence_started()
signal sequence_finished()

@export var create_camera2d := true
@export var events : Array[Event]

var event_idx : int = 0
var camera2d : Camera2D


func _ready():
	if create_camera2d:
		_init_camera2d()
	start_sequence()


func start_sequence():
	for event in events:
		if event:
			event.init(self)
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
		if event_idx >= events.size():
			for e in events:
				if not e.finished:
					await e.event_finished
			sequence_finished.emit()
		return true
	else:
		sequence_finished.emit()
	return false


func _init_camera2d():
	camera2d = Camera2D.new()
	camera2d.anchor_mode = Camera2D.ANCHOR_MODE_DRAG_CENTER
	camera2d.global_position = get_window().size / 2
	camera2d.make_current()
	camera2d.add_to_group("Camera2D")
	add_child(camera2d)
