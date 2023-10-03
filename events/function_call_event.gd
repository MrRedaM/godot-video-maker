class_name FunctionCallEvent
extends Event


@export var funciton_name : String


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_call_func(node)


func _call_func(node: Node):
	node.call(funciton_name)
