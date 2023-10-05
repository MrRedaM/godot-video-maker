class_name TranslationEvent
extends Event


@export var vector := Vector2.ZERO
@export var add_to_position := true


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_translate_canvas(node)


func _translate_canvas(canvas: CanvasItem):
	if add_to_position:
		AnimationUtils.animate_canvas_property(self, canvas, "position", canvas.position + vector)
	else:
		AnimationUtils.animate_canvas_property(self, canvas, "position", vector)
