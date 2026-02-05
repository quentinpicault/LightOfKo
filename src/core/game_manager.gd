class_name GameManager extends CanvasLayer

signal gravity_changed(gravity: float)
signal move_enabled(flag: bool)
signal mask_active(flag: bool)

@onready var player = $"MixedWorlds/LightWorld/Player"
@onready var level = $"MixedWorlds/LightWorld/Level"
@onready var checkpoints = $"MixedWorlds/LightWorld/Level/Checkpoints"
@onready var goals = $"MixedWorlds/LightWorld/Level/Goals"
@onready var pearls = $"MixedWorlds/LightWorld/Level/Pearls"
@onready var invisible_wall = $"MixedWorlds/LightWorld/Level/InvisibleWall"
@onready var mask_wall = $"MixedWorlds/LightWorld/Level/MaskWall"
@onready var iris = $Iris

@export var LEVEL = 0
@export var GAME_SCORE = 0
@export var GRAVITY = 1700.0
@export var OBSCURITY = false
@export var MASK_OBTAINED = false
@export var MASK_ACTIVE = false
@export var mix_worlds_shader: ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if LEVEL > 0:
		player.position.x -= LEVEL * 3850
		level.position.x -= LEVEL * 3850
		invisible_wall.position.x += LEVEL * 3850
		
		for i in range(LEVEL):
			goals.get_child(i).queue_free()
		
		if LEVEL > 1:
			mask_wall.queue_free()
	
	check_level_conditions()
	start_game()
	
	AudioManager.play()
	if MASK_ACTIVE:
		AudioManager.switch_track(true)
	else:
		AudioManager.switch_track(false)
	gravity_changed.connect(player._on_game_manager_gravity_changed)
	move_enabled.connect(player._on_game_manager_move_enabled)
	mask_active.connect(player._on_game_manager_mask_active)
	gravity_changed.emit(GRAVITY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var should_move = false
	if player.motion_mode == 0:
		if MASK_OBTAINED and Input.is_action_just_pressed("interact"):
			toggle_mask()
			if MASK_ACTIVE:
				AudioManager.play_mask_on()
				AudioManager.switch_track(true)
			else:
				AudioManager.play_mask_off()
				AudioManager.switch_track(false)
		
		if !OBSCURITY:
			should_move = true
		elif MASK_ACTIVE:
			should_move = true
			
	move_enabled.emit(should_move)

func toggle_mask():
	MASK_ACTIVE = !MASK_ACTIVE
	if MASK_ACTIVE:
		fade_to_mask()
	else:
		fade_to_world()
	mask_active.emit(MASK_ACTIVE)

func start_game():
	for pearl in pearls.get_children():
		pearl.visible = true
	
	player.motion_mode = 0
	var checkpoint = checkpoints.get_child(LEVEL)
	player.global_position = checkpoint.global_position
	
	iris.scale = Vector2(0.0, 0.0)
	await get_tree().create_timer(0.2).timeout
	
	AudioManager.play_iris_in()
	var tween = create_tween()
	
	tween.tween_property(iris, "scale", Vector2(130.0, 130.0), 0.7)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

func fade_to_world(duration: float = 0.2):
	var tween = create_tween()
	tween.tween_property(mix_worlds_shader.material, "shader_parameter/mix_amount", 0.0, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

func fade_to_mask(duration: float = 0.2):
	var tween = create_tween()
	tween.tween_property(mix_worlds_shader.material, "shader_parameter/mix_amount", 1.0, duration)\
		.set_trans(Tween.TRANS_SINE)
		
func check_level_conditions() -> void:
	OBSCURITY = LEVEL > 1
	MASK_OBTAINED = LEVEL > 1

func _on_player_mask_obtained() -> void:
	MASK_OBTAINED = true
	mask_wall.queue_free()
		
func _on_player_goal(score: int) -> void:
	GAME_SCORE += score
	print("Total Score: %d" % GAME_SCORE)

	# Tricky: force FEAR mode during the screen transition is the simplest way to prevent moving
	if MASK_ACTIVE:
		toggle_mask()
	MASK_OBTAINED = false
	OBSCURITY = true
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(player, "position:x", player.position.x - 3850, 0.6)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(level, "position:x", level.position.x - 3850, 0.6)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	
	await tween.finished
	invisible_wall.global_position.x += 3850
	LEVEL += 1
	check_level_conditions()

func _on_player_died() -> void:
	player.motion_mode = 1
	if MASK_ACTIVE:
		toggle_mask()
		
	AudioManager.play_death()
	var tween0 = create_tween()
	for i in range(4):
		tween0.tween_property(player, "modulate:a", 0.0, 0.1)
		tween0.tween_property(player, "modulate:a", 1.0, 0.1)
		
	await tween0.finished
	iris.scale = Vector2(130.0, 130.0)
	AudioManager.play_iris_out()
	var tween1 = create_tween()
	tween1.tween_property(iris, "scale", Vector2(0.0, 0.0), 0.7)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
	await tween1.finished
	start_game()
