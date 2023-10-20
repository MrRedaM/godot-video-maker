class_name LoopEvent
extends Event


@export var iterations := 1
@export var delay_between_iterations := 0.0
@export var events : Array[Event]


var _event_player : EventPlayer


func start_event():
	super()
	_event_player = EventPlayer.new(_sequence, events)
	if iterations > 0:
		for i in iterations:
			_event_player.play()
			await _event_player.finished
			if i < iterations - 1:
				await _sequence.get_tree().create_timer(delay_between_iterations).timeout
	event_finished.emit()
