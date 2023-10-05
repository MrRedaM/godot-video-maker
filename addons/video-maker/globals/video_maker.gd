extends Node


func _search_node(node_path):
	return get_tree().current_scene.find_child(node_path)


func _animate_canvas_property(event: Event, canvas: CanvasItem, property: String, value) -> Tween:
	var tween = canvas.create_tween()
	tween.set_trans(event.trans_type)
	tween.set_ease(event.ease_type)
	tween.tween_property(canvas, property, value, event.duration)
	return tween

