class_name ScaleTweener
extends CustomPropertyTweener


@export var scale := Vector2(1, 1)
@export var hide_on_sequence_start := false


func init(sequence: Sequence, target_nodes):
	super(sequence, target_nodes)
	if hide_on_sequence_start:
		for node in target_nodes:
			if node is CanvasItem:
				if node.get_parent() is Container:
					await _sequence.get_tree().process_frame
				node.scale = Vector2.ZERO
				if node is Control:
					node.pivot_offset = node.size / 2


func get_property() -> String:
	return "scale"


func get_value() -> Variant:
	return scale
