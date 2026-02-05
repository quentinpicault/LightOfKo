class_name PearlAnimation extends Node2D

@onready var sprite = $Sprite2D

func _ready():
	var tween = create_tween()
	
	tween.set_parallel(true)
	
	tween.tween_property(sprite, "scale", Vector2(1.2, 1.5), 0.4)\
		.set_trans(Tween.TRANS_QUAD)\
		.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(sprite, "modulate:a", 0.0, 0.4)

	await tween.finished

	queue_free()