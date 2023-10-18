class_name TextAnimationTweener
extends CustomPropertyTweener


@export_range(0.0, 1.0) var visible_ratio := 1.0
@export var hide_on_sequence_start := false


func init(sequence: Sequence, target_nodes: Array[Node]):
	super(sequence, target_nodes)
	if hide_on_sequence_start:
		for node in _target_nodes:
			if node is CanvasItem:
				node.visible_ratio = 0


func get_property() -> String:
	return "visible_ratio"


func get_value() -> Variant:
	return visible_ratio


#func init(sequence: Sequence):
#	super(sequence)
#	if hide_on_sequence_start:
#		for node in target_nodes:
#			if node is Label or node is RichTextLabel:
#				node.visible_ratio = 0
#
#
#func start_event():
#	super()
#	for node in target_nodes:
#		if node is Label or node is RichTextLabel:
#			_animate_text_visible_ratio(node)
#
#
#func _animate_text_visible_ratio(text: Control):
#	AnimationUtils.animate_canvas_property(self, text, "visible_ratio", visible_ratio)
