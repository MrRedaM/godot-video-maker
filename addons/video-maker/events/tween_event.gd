class_name TweenEvent
extends Event

@export_group("Tween params")
@export var duration := 1.0
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType


func start_event():
	super()
	_sequence.get_tree().create_timer(duration).timeout.connect(func(): event_finished.emit())
