class_name TranslationTweener
extends CustomPropertyTweener


@export var vector := Vector2.ZERO
@export var relative := true
@export var apply_reversed_trans_on_start := false


func init(sequence: Sequence, target_nodes: Array[Node]):
	super(sequence, target_nodes)
	await _sequence.get_tree().process_frame
	for node in target_nodes:
		if apply_reversed_trans_on_start and relative and node is CanvasItem:
			node.position -= vector


func get_property() -> String:
	return "position"


func get_value() -> Variant:
	return vector
