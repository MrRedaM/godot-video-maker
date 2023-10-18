class_name OpacityTweener
extends CustomPropertyTweener


@export var opacity := 1.0
@export var hide_on_sequence_start := false


func init(sequence: Sequence, target_nodes: Array[Node]):
	super(sequence, target_nodes)
	if hide_on_sequence_start:
		for node in _target_nodes:
			if node is CanvasItem:
				node.modulate.a = 0


func get_property() -> String:
	return "modulate:a"


func get_value() -> Variant:
	return opacity
