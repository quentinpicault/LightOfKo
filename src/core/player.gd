class_name Player extends CharacterBody2D

signal position_changed(position: Transform2D)
signal facing_changed(facing: Utilities.Facing)
signal state_changed(state: Utilities.State)

@onready var state_machine = $PlayerStateMachine
@onready var gravity = 0.0

@export var MOVE_ENABLED = false
@export var TERMINAL_VELOCITY = 600.0
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -800.0

func _process(delta: float) -> void:
	position_changed.emit(global_transform)
	if MOVE_ENABLED and Input.is_action_pressed("move_left"):
		state_machine.change_facing(Utilities.Facing.LEFT)
		facing_changed.emit(Utilities.Facing.LEFT)
	if MOVE_ENABLED and Input.is_action_pressed("move_right"):
		state_machine.change_facing(Utilities.Facing.RIGHT)
		facing_changed.emit(Utilities.Facing.RIGHT)

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	if not is_on_floor():
		velocity += Vector2(0, gravity) * delta
		velocity.y = min(velocity.y, TERMINAL_VELOCITY)
		
		if velocity.y > 0:
			state_machine.change_state(Utilities.State.FALL)
			state_changed.emit(Utilities.State.FALL)
	
	else :
		if MOVE_ENABLED and direction:
			state_machine.change_state(Utilities.State.RUN)
			state_changed.emit(Utilities.State.RUN)
		else:
			state_machine.change_state(Utilities.State.IDLE)
			state_changed.emit(Utilities.State.IDLE)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		state_machine.change_state(Utilities.State.JUMP)
		state_changed.emit(Utilities.State.JUMP)
		velocity.y = JUMP_VELOCITY

	if MOVE_ENABLED and direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_world_gravity_changed(world_gravity: float) -> void:
	gravity = world_gravity


func _on_world_mask_active(flag: bool) -> void:
	state_machine.current_mask = flag


func _on_world_move_enabled(flag: bool) -> void:
	MOVE_ENABLED = flag
