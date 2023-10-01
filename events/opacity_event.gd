class_name OpacityEvent
extends Event


@export var opacity := 1.0


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			animate_opacity_canvas(node)


func animate_opacity_canvas(canvas: CanvasItem):
	var tween = canvas.create_tween()
	tween.tween_property(canvas, "modulate:a", opacity, duration)
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	await tween.finished
	event_finished.emit()

