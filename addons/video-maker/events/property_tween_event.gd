class_name PropertyTweenEvent
extends Event


@export var loop := false
@export var loop_iterations := 0
@export var parallel := false
@export var tweeners : Array[TweenerResource]


func start_event():
	super()
	for node in target_nodes:
		_start_tween_sequence(node)


func _start_tween_sequence(node: Node):
	var tween = _sequence.create_tween()
	if loop:
		tween.set_loops(loop_iterations)
	tween.set_parallel(parallel)
	for tweener in tweeners:
		tween.tween_property(node,
			tweener.property,
			tweener.value[0],
			tweener.duration).set_trans(tweener.trans_type).set_ease(tweener.ease_type).set_delay(tweener.delay)
