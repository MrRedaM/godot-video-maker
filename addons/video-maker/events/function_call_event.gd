class_name FunctionCallEvent
extends Event


@export var funciton_name : String
@export var parameters: Array
@export var target_nodes_paths : Array[NodePath]

var target_nodes : Array[Node]


func start_event():
	super()

	for path in target_nodes_paths:
		var node = _sequence.get_node(path)
		if node:
			target_nodes.append(node)

	for node in target_nodes:
		if node is CanvasItem:
			_call_func(node)


func _call_func(node: Node):
	if node.has_method(funciton_name):
		node.callv(funciton_name, parameters)
