class_name TweenerAnimation
extends Resource


@export_group("Tweener params")
@export var override_params := false
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType
@export var delay := 0.0

enum TweenerType {Property, Method, Callback, Interval}

var type : TweenerType : get = get_type
var target_node : Node

var _sequence : Sequence
var _target_nodes : Array[Node]


func init(sequence: Sequence, target_nodes: Array[Node]):
	_sequence = sequence
	_target_nodes = target_nodes


func get_type() -> TweenerAnimation.TweenerType:
	return type
