class_name RotationEvent
extends Event


@export var angle := 90.0


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			rotate_canvas(node)


func rotate_canvas(canvas: CanvasItem):
	VideoMaker._animate_canvas_property(self, canvas, "rotation_degrees", angle)
