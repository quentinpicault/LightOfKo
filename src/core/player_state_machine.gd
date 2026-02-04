class_name PlayerStateMachine extends Node2D

@onready var regular_sprite = $"../RegularKo"
@onready var mask_sprite = $"../MaskKo"

@export var current_facing := Utilities.Facing.RIGHT
@export var current_state := Utilities.State.IDLE
@export var current_mask := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	regular_sprite.visible = !current_mask
	mask_sprite.visible = current_mask
	
	match current_state:
		Utilities.State.IDLE:
			regular_sprite.play("idle")
			mask_sprite.play("idle")
			
		Utilities.State.FEAR:
			regular_sprite.play("fear")
			mask_sprite.play("fear")
			
		Utilities.State.RUN:
			regular_sprite.play("run")
			mask_sprite.play("run")
			
		Utilities.State.JUMP:
			regular_sprite.play("jump")
			mask_sprite.play("jump")
			
		Utilities.State.FALL:
			regular_sprite.play("fall")
			mask_sprite.play("fall")
	
	match current_facing:
		Utilities.Facing.LEFT:
			regular_sprite.flip_h = true
			mask_sprite.flip_h = true
			
		Utilities.Facing.RIGHT:
			regular_sprite.flip_h = false
			mask_sprite.flip_h = false

func change_state(new_state: Utilities.State):
	current_state = new_state

func change_facing(new_facing: Utilities.Facing):
	current_facing = new_facing
	
func change_mask(mask_active: bool):
	current_mask = mask_active
