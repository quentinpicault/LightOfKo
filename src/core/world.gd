class_name World extends Node2D

signal gravity_changed(gravity: float)
signal move_enabled(flag: bool)
signal mask_active(flag: bool)

@onready var player = $"LightWorld/Player"

@export var GRAVITY = 2000.0
@export var OBSCURITY = false
@export var MASK_OBTAINED = false
@export var MASK_ACTIVE = false
@export var mask_shader: ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play()
	if MASK_ACTIVE:
		AudioManager.switch_track(true)
	else:
		AudioManager.switch_track(false)
	gravity_changed.connect(player._on_world_gravity_changed)
	move_enabled.connect(player._on_world_move_enabled)
	mask_active.connect(player._on_world_mask_active)
	gravity_changed.emit(GRAVITY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var should_move = false
	
	if MASK_OBTAINED and Input.is_action_just_pressed("interact"):
		toggle_mask()
		mask_active.emit(MASK_ACTIVE)
	
	if !OBSCURITY:
		should_move = true
	elif MASK_ACTIVE:
		should_move = true
		
	move_enabled.emit(should_move)

func toggle_mask():
	MASK_ACTIVE = !MASK_ACTIVE
	if MASK_ACTIVE:
		AudioManager.play_mask_on()
		AudioManager.switch_track(true)
		fade_to_mask()
	else:
		AudioManager.play_mask_off()
		AudioManager.switch_track(false)
		fade_to_world()
	
func fade_to_world(duration: float = 0.2):
	var tween = create_tween()
	tween.tween_property(mask_shader.material, "shader_parameter/blend_amount", 0.0, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

func fade_to_mask(duration: float = 0.2):
	var tween = create_tween()
	tween.tween_property(mask_shader.material, "shader_parameter/blend_amount", 1.0, duration)\
		.set_trans(Tween.TRANS_SINE)
