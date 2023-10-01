class_name FadeInEvent
extends Event


@export_node_path() var target_node_path : NodePath
var target_node : Node


func start_event():
	super()
	target_node = VideoMaker.get_tree().current_scene.find_child(target_node_path)
	if not target_node:
		return
	if target_node is CanvasItem:
		fade_in_canvas(target_node)


func fade_in_canvas(canvas: CanvasItem):
	canvas.modulate.a = 0
	canvas.show()
	var tween = canvas.create_tween()
	tween.tween_property(canvas, "modulate:a", 1, duration)
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	tween.finished.connect(_tween_finished)


func _tween_finished():
	event_finished.emit()
