class_name FunctionCallEvent
extends Event


@export var funciton_name : String
@export var parameters: Array


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_call_func(node)


func _call_func(node: Node):
	if node.has_method(funciton_name):
		node.callv(funciton_name, parameters)
