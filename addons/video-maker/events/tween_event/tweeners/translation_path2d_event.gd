class_name TranslationPath2DEvent
extends CustomMethodTweener


@export_node_path("Path2D") var path2d_node_path: NodePath

var _path2d: Path2D
var _follow: PathFollow2D
var _original_position


func init(seqauence: Sequence, target_nodes: Array[Node]):
	super(seqauence, target_nodes)
	_path2d = _sequence.find_child(path2d_node_path)
	_follow = PathFollow2D.new()
	_follow.rotates = false
	_follow.loop = false
	_path2d.add_child(_follow)


func get_method() -> Callable:
	_original_position = target_node.global_position
	return _get_canvas_path_relative_position


func get_from_value() -> Variant:
	return 0.0


func get_to_value() -> Variant:
	return 1.0


func _get_canvas_path_relative_position(ratio: float):#, canvas, original_position):
	_follow.progress_ratio = ratio
	target_node.global_position = _original_position + _follow.position - _path2d.curve.get_point_position(0)
