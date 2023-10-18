class_name Event
extends Resource


signal event_started()
signal event_finished()

enum StartMode {WITH_PREVIOUS, AFTER_PREVIOUS}

@export var target_nodes_paths : Array[NodePath]
@export_group("Event params")
@export var start_mode : StartMode
@export var delay := 0.0

var target_nodes : Array[Node]
var finished := false

var _sequence : Sequence


func init(sequence: Sequence):
	_sequence = sequence
	for path in target_nodes_paths:
		var node = sequence.get_node(path)
		if node:
			target_nodes.append(node)


func start_event():
	event_started.emit()
	event_finished.connect(func(): finished = true)

