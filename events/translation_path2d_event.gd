class_name TranslationPath2DEvent
extends Event


@export_node_path("Path2D") var path2d_node_path: NodePath

var path2d: Path2D
var follow: PathFollow2D


func start_event():
	super()
	path2d = VideoMaker._search_node(path2d_node_path)
	for node in target_nodes:
		if node is CanvasItem:
			_follow_path_canvas(node)


func _follow_path_canvas(canvas: CanvasItem):
	follow = PathFollow2D.new()
	follow.rotates = false
	follow.loop = false
	path2d.add_child(follow)
	var tween = canvas.create_tween()
	tween.set_trans(trans_type)
	tween.set_ease(ease_type)
	var original_position = canvas.global_position
	tween.tween_method(_get_canvas_path_relative_position.bind(canvas, original_position), 0.0, 1.0, duration)


func _get_canvas_path_relative_position(ratio, canvas, original_position):
	follow.progress_ratio = ratio
	canvas.position = original_position + follow.global_position - path2d.curve.get_point_position(0)
