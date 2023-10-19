class_name CustomMethodTweener
extends TweenerAnimation


@export var duration := 0.0

var method : Callable : get = get_method
var from_value : Variant : get = get_from_value
var to_value : Variant : get = get_to_value
var local_method := false


func init(seqauence: Sequence, target_nodes: Array[Node]):
	super(seqauence, target_nodes)


func get_method() -> Callable:
	return method


func get_from_value() -> Variant:
	return from_value


func get_to_value() -> Variant:
	return to_value
