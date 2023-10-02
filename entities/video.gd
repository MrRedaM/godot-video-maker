class_name Video
extends Node


signal video_started()
signal video_finished()

@export var sequences : Array[Sequence]

var sequence_idx := 0


func _ready():
	for node in get_tree().get_nodes_in_group("StartZeroOpacity"):
		if node is CanvasItem:
			node.modulate.a = 0
	for node in get_tree().get_nodes_in_group("StartZeroScale"):
		if node is CanvasItem:
			node.scale = Vector2.ZERO
			if node is Control:
				node.pivot_offset = node.size / 2
	start_video()


func start_video():
	video_started.emit()
	start_next_sequence()


func start_next_sequence():
	if sequence_idx < sequences.size():
		var sequence = sequences[sequence_idx]
		sequence.start_sequence()
		sequence.sequence_finished.connect(func():
			sequence_idx += 1
			start_next_sequence())
	else:
		video_finished.emit()
