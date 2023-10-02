class_name ScaleEvent
extends Event


@export var scale := Vector2(1, 1)


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			scale_canvas(node)


func scale_canvas(canvas: CanvasItem):
	var tween = canvas.create_tween()
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	tween.tween_property(canvas, "scale", scale, duration)
	await tween.finished
	event_finished.emit()
