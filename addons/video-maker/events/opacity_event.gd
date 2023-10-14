class_name OpacityEvent
extends TweenEvent


@export var opacity := 1.0
@export var hide_on_sequence_start := false


func init(sequence: Sequence):
	super(sequence)
	if hide_on_sequence_start:
		for node in target_nodes:
			if node is CanvasItem:
				node.modulate.a = 0


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_animate_opacity_canvas(node)


func _animate_opacity_canvas(canvas: CanvasItem):
	AnimationUtils.animate_canvas_property(self, canvas, "modulate:a", opacity)

