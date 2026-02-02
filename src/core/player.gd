class_name Player extends CharacterBody2D

@onready var state_machine = $PlayerStateMachine

@export var GRAVITY = 2000.0
@export var TERMINAL_VELOCITY = 600.0
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -800.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		state_machine.change_facing(Utilities.Facing.LEFT)
	if Input.is_action_just_pressed("ui_right"):
		state_machine.change_facing(Utilities.Facing.RIGHT)
	if Input.is_action_just_pressed("ui_up"):
		state_machine.toggle_mask()

func _physics_process(delta: float) -> void:
	# Add the GRAVITY.
	if not is_on_floor():
		velocity += Vector2(0, GRAVITY) * delta
		velocity.y = min(velocity.y, TERMINAL_VELOCITY)
		
		if velocity.y > 0:
			state_machine.change_state(Utilities.State.FALL)
	
	else :
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			state_machine.change_state(Utilities.State.RUN)
		else:
			state_machine.change_state(Utilities.State.IDLE)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		state_machine.change_state(Utilities.State.JUMP)
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
