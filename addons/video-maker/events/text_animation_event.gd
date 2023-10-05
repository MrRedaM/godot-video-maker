class_name TextAnimationEvent
extends Event


@export_range(0.0, 1.0) var visible_ratio := 1.0


func start_event():
	super()
	for node in target_nodes:
		if node is Label or node is RichTextLabel:
			_animate_text_visible_ratio(node)


func _animate_text_visible_ratio(text: Control):
	VideoMaker._animate_canvas_property(self, text, "visible_ratio", visible_ratio)
