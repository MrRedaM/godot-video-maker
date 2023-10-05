class_name OpacityEvent
extends Event


@export var opacity := 1.0


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_animate_opacity_canvas(node)


func _animate_opacity_canvas(canvas: CanvasItem):
	VideoMaker._animate_canvas_property(self, canvas, "modulate:a", opacity)

