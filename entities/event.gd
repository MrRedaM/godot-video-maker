class_name Event
extends Resource


signal event_started()
signal event_finished()

enum StartMode {WITH_PREVIOUS, AFTER_PREVIOUS}

@export var target_nodes_paths : Array[NodePath]
@export var start_mode : StartMode
@export var duration := 1.0
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType
@export var delay := 0.0

var target_nodes : Array[Node]


func start_event():
	for path in target_nodes_paths:
		var node = VideoMaker.search_node(path)
		if node:
			target_nodes.append(node)
	if not target_nodes.is_empty():
		return
	event_started.emit()


