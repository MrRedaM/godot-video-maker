class_name Camera2DFocusEvent
extends TweenEvent


@export var zoom := Vector2(1, 1)
@export var reset_camera := false

var camera : Camera2D


func start_event():
	super()
	camera = _sequence.get_tree().get_first_node_in_group("Camera2D")
	if reset_camera:
		_reset_camera()
	else:
		_focus_on_target()


func _focus_on_target():
	if target_nodes[0]:
		AnimationUtils.animate_canvas_property(
			self,
			camera,
			"position",
			target_nodes[0].position + (target_nodes[0].size / 2) - camera.offset
		)
	if zoom != Vector2.ZERO:
		AnimationUtils.animate_canvas_property(
			self,
			camera,
			"zoom",
			zoom
		)


func _reset_camera():
	AnimationUtils.animate_canvas_property(
			self,
			camera,
			"position",
			Vector2.ZERO
		)
	AnimationUtils.animate_canvas_property(
		self,
		camera,
		"zoom",
		Vector2(1, 1)
	)
