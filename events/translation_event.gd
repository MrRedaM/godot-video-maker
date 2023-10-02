class_name TranslationEvent
extends Event


@export var position := Vector2.ZERO


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			translate_canvas(node)



func translate_canvas(canvas: CanvasItem):
	var tween = canvas.create_tween()
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	tween.tween_property(canvas, "position", position, duration)
	await tween.finished
	event_finished.emit()
