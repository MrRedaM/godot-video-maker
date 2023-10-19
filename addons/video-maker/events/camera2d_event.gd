class_name Camera2DEvent
extends Event


@export var duration := 0.0
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType
@export_group("Focus on node")
@export var enable_focus_on_node := false
@export var target_node_path : NodePath
@export_group("Tanslation")
@export var enable_translation := false
@export var vector := Vector2.ZERO
@export var relative_translation := true
@export_group("Zoom")
@export var apply_zoom := false
@export var zoom := Vector2(1, 1)
@export var relative_zoom := false
@export_group("Reset camera")
@export var reset_position := false
@export var reset_zoom := false

var camera : Camera2D
var tween : Tween


func init(sequence: Sequence):
	super(sequence)
	camera = _sequence.get_tree().get_first_node_in_group("Camera2D")


func start_event():
	tween = _sequence.create_tween()
	tween.set_parallel(true)
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	if enable_focus_on_node:
		_focus_on_node()
	if enable_translation:
		_translate()
	if apply_zoom:
		_zoom()
	if reset_position:
		_reset_position()
	if reset_zoom:
		_reset_zoom()
	if tween:
		await tween.finished
		event_finished.emit()


func _focus_on_node():
	var target_node = _sequence.get_node(target_node_path)
	if target_node:
		tween.tween_property(
			camera,
			"position",
			target_node.global_position if not (target_node is Control) else target_node.global_position + (target_node.size / 2),
			duration
		)


func _translate():
	var tweener = tween.tween_property(
		camera,
		"position",
		vector,
		duration)
	if relative_translation:
		tweener.as_relative()


func _zoom():
	if zoom != Vector2.ZERO:
		var tweener = tween.tween_property(
			camera,
			"zoom",
			zoom,
			duration
		)
		if relative_zoom:
			tweener.as_relative()


func _reset_position():
	var tweener = tween.tween_property(
		camera,
		"position",
		_sequence.get_window().size / 2,
		duration
		)


func _reset_zoom():
	tween.tween_property(
		camera,
		"zoom",
		Vector2(1, 1),
		duration)
