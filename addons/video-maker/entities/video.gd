class_name Video
extends Node


signal video_started()
signal video_finished()

@export var sequences : Array[PackedScene]

var sequence : Sequence
var sequence_idx := 0


func _ready():
	start_video()
	video_finished.connect(func(): get_tree().quit())


func start_video():
	video_started.emit()
	start_next_sequence()


func start_next_sequence():
	if sequence_idx < sequences.size():
		sequence = sequences[sequence_idx].instantiate()
		add_child(sequence)
		sequence.sequence_finished.connect(func():
			sequence_idx += 1
			sequence.queue_free()
			start_next_sequence())
	else:
		video_finished.emit()
