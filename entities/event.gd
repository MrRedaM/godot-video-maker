class_name Event
extends Resource


signal event_started()
signal event_finished()

enum StartMode {WITH_PREVIOUS, AFTER_PREVIOUS}

@export var start_mode : StartMode
@export var duration := 1.0
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType
@export var delay := 0.0


func start_event():
	event_started.emit()


