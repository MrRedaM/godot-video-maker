class_name AnimationUtils
extends Script


static func animate_canvas_property(event: Event, canvas: CanvasItem, property: String, value) -> Tween:
	var tween = canvas.create_tween()
	tween.set_trans(event.trans_type)
	tween.set_ease(event.ease_type)
	tween.tween_property(canvas, property, value, event.duration)
	return tween

