class_name CustomPropertyTweener
extends TweenerAnimation


@export var duration := 0.0

var property : String : get = get_property
var value : Variant : get = get_value


func init(seqauence: Sequence, target_nodes: Array[Node]):
	super(seqauence, target_nodes)


func get_property() -> String:
	return property


func get_value() -> Variant:
	return value
