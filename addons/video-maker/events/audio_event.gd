class_name AudioEvent
extends Event


@export var stream : AudioStream


func start_event():
	duration = stream.get_length()
	super()
	var player = AudioStreamPlayer.new()
	player.stream = stream
	_sequence.add_child(player)
	player.play()
	player.finished.connect(func(): player.queue_free())
