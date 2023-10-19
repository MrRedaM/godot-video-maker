class_name TweenEvent
extends Event


@export var parallel := false
@export var loop := false
@export var loop_iterations := 0
@export var tweeners : Array[TweenerAnimation]

@export_group("Default tween params")
@export var apply_default_params := false
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType

var tween : Tween


func init(sequence: Sequence):
	super(sequence)
	for tweener in tweeners:
		tweener.init(sequence, target_nodes)


func start_event():
	super()
	var duration = 0.0
	for node in target_nodes:
		tween = _sequence.create_tween()
		tween.set_parallel(parallel)
		if loop:
			tween.set_loops(loop_iterations)
		if apply_default_params:
			tween.set_trans(trans_type)
			tween.set_ease(ease_type)
		for tweener in tweeners:
			tweener.target_node = node
			if tweener is CustomPropertyTweener:
				var property_tweener = tween.tween_property(
					tweener.target_node, tweener.property, tweener.value, tweener.duration)
				if tweener.override_params:
					property_tweener.set_trans(tweener.trans_type)
					property_tweener.set_ease(tweener.ease_type)
					property_tweener.set_delay(tweener.delay)
				if "relative" in tweener and tweener.relative:
					property_tweener.as_relative()
			if tweener is CustomMethodTweener:
				var method_tweener = tween.tween_method(tweener.method, tweener.from_value, tweener.to_value, tweener.duration)
				if tweener.override_params:
					method_tweener.set_trans(tweener.trans_type)
					method_tweener.set_ease(tweener.ease_type)
					method_tweener.set_delay(tweener.delay)
#			if tweener.type == TweenerAnimation.TweenerType.Callback:
#				pass
#			if tweener.type == TweenerAnimation.TweenerType.Interval:
#				pass
			if "duration" in tweener:
				duration += tweener.duration
			if tweener.override_params:
				duration += tweener.delay
	await tween.finished
	event_finished.emit()
