class_name Sequence
extends Node


signal sequence_started()
signal sequence_finished()

@export var create_camera2d := true
@export var events : Array[Event]

var _event_player : EventPlayer
var _camera2d : Camera2D


func _ready():
	if create_camera2d:
		_init_camera2d()
	start_sequence()


func start_sequence():
	sequence_started.emit()
	_event_player = EventPlayer.new(self, events)
	_event_player.play()
	await _event_player.finished
	sequence_finished.emit()


func _init_camera2d():
	_camera2d = Camera2D.new()
	_camera2d.anchor_mode = Camera2D.ANCHOR_MODE_DRAG_CENTER
	_camera2d.global_position = get_window().size / 2
	_camera2d.make_current()
	_camera2d.add_to_group("Camera2D")
	add_child(_camera2d)
