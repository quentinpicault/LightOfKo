extends CharacterBody2D

@export var GRAVITY = 2000.0
@export var TERMINAL_VELOCITY = 600.0
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -800.0


func _physics_process(delta: float) -> void:
	# Add the GRAVITY.
	if not is_on_floor():
		velocity += Vector2(0, GRAVITY) * delta
		velocity.y = min(velocity.y, TERMINAL_VELOCITY)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
