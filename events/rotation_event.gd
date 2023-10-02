class_name RotationEvent
extends Event


@export var angle := 90.0


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			rotate_canvas(node)



func rotate_canvas(canvas: CanvasItem):
	var tween = canvas.create_tween()
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	tween.tween_property(canvas, "rotation_degrees", angle, duration)
	await tween.finished
	event_finished.emit()
