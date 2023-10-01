
extends Event


@export_node_path() var target_node_path : NodePath
var target_node : Node

func start_event():
	super()
	target_node = VideoMaker.get_tree().current_scene.find_child(target_node_path)
	if not target_node:
		return


