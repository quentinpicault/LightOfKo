class_name ShadowStateMachine extends Node2D

@onready var shadow_sprite = $"../ShadowKo"

@export var current_facing := Utilities.Facing.RIGHT
@export var current_state := Utilities.State.IDLE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_state:
		Utilities.State.IDLE:
			shadow_sprite.play("idle")
			
		Utilities.State.FEAR:
			shadow_sprite.play("fear")
			
		Utilities.State.RUN:
			shadow_sprite.play("run")
			
		Utilities.State.JUMP:
			shadow_sprite.play("jump")
			
		Utilities.State.FALL:
			shadow_sprite.play("fall")
	
	match current_facing:
		Utilities.Facing.LEFT:
			shadow_sprite.flip_h = true
			
		Utilities.Facing.RIGHT:
			shadow_sprite.flip_h = false

func change_state(new_state: Utilities.State):
	current_state = new_state

func change_facing(new_facing: Utilities.Facing):
	current_facing = new_facing
