class_name TranslationEvent
extends Event


@export var position := Vector2.ZERO


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_translate_canvas(node)


func _translate_canvas(canvas: CanvasItem):
	VideoMaker._animate_canvas_property(self, canvas, "position", position)
