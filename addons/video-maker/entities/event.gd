class_name Event
extends Resource


signal event_started()
signal event_finished()

enum StartMode {WITH_PREVIOUS, AFTER_PREVIOUS}

@export_group("Event params")
@export var start_mode : StartMode = StartMode.AFTER_PREVIOUS
@export var delay := 0.0

var finished := false

var _sequence : Sequence


func init(sequence: Sequence):
	_sequence = sequence


func reset():
	finished = false


func start_event():
	event_started.emit()
	event_finished.connect(func(): finished = true)

