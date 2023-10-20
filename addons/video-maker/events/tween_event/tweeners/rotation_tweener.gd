class_name RotationTweener
extends CustomPropertyTweener


@export var angle := 0.0
@export var apply_reversed_rotation_on_start := false


func init(sequence: Sequence, target_nodes: Array[Node]):
	super(sequence, target_nodes)
	await _sequence.get_tree().process_frame
	for node in target_nodes:
		if node is Control:
			node.pivot_offset = node.size / 2
		if apply_reversed_rotation_on_start and node is CanvasItem:
			node.rotation_degrees -= angle



func get_property() -> String:
	return "rotation_degrees"


func get_value() -> Variant:
	return angle
