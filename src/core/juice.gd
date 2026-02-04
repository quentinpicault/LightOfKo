class_name Juice extends Node2D

@export var pearl_animation_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pearl_pearl_collected(amount: int, position: Vector2) -> void:
	var pearl_anim = pearl_animation_scene.instantiate()
	pearl_anim.position = position
	add_child(pearl_anim)
