class_name ScaleEvent
extends Event


@export var scale := Vector2(1, 1)
@export var hide_on_sequence_start := false


func init(sequence: Sequence):
	super(sequence)
	if hide_on_sequence_start:
		for node in target_nodes:
			if node is CanvasItem:
				node.scale = Vector2.ZERO
				if node is Control:
					node.pivot_offset = node.size / 2


func start_event():
	super()
	for node in target_nodes:
		if node is CanvasItem:
			_scale_canvas(node)


func _scale_canvas(canvas: CanvasItem):
	AnimationUtils.animate_canvas_property(self, canvas, "scale", scale)
