class_name ScaleEvent
extends Event


@export var scale := Vector2(1, 1)


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			scale_canvas(node)


func scale_canvas(canvas: CanvasItem):
	VideoMaker._animate_canvas_property(self, canvas, "scale", scale)
