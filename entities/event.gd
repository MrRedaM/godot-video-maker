class_name Event
extends Resource


signal event_started(event)
signal event_finished(event)

enum StartMode {WITH_PREVIOUS, AFTER_PREVIOUS}

@export
var start_mode : StartMode

@export
var delay := 0.0


func start_event():
	event_started.emit(self)


