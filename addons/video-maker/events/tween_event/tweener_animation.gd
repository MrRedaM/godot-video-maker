class_name TweenerAnimation
extends Resource


@export var relative := false

@export_group("Tweener params")
@export var override_params := false
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType
@export var delay := 0.0

var target_node : Node : get = get_target_node
var idx : int

var _sequence : Sequence
var _target_nodes : Array[Node]


func init(sequence: Sequence, target_nodes: Array[Node]):
	_sequence = sequence
	_target_nodes = target_nodes


func reset():
	pass


func get_target_node() -> Node:
	return target_node
