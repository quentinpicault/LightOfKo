extends Node

var jump_rr := 1

@onready var title: AudioStreamPlayer = $Title
@onready var intro: AudioStreamPlayer = $Intro
@onready var stage_with_mask: AudioStreamPlayer = $StageWithMask
@onready var stage_without_mask: AudioStreamPlayer = $StageWithoutMask
@onready var get_mask: AudioStreamPlayer = $GetMask
@onready var sad: AudioStreamPlayer = $Sad
@onready var happy: AudioStreamPlayer = $Happy

@onready var playing_sounds = $PlayingSounds

@export var sfx_scene: PackedScene
@export var iris_in: AudioStream
@export var iris_out: AudioStream
@export var mask_on: AudioStream
@export var mask_off: AudioStream
@export var pearl_sfx: AudioStream
@export var death_sfx: AudioStream
@export var fear_sfx: AudioStream
@export var jump1_sfx: AudioStream
@export var jump2_sfx: AudioStream
@export var jump3_sfx: AudioStream

func _ready() -> void:
	title.volume_db = -80.0
	intro.volume_db = -80.0
	stage_without_mask.volume_db = -80.0
	stage_with_mask.volume_db = -80.0
	get_mask.volume_db = -80.0
	sad.volume_db = -80.0
	happy.volume_db = -80.0
	
func play() -> void:
	title.play()
	intro.play()
	stage_without_mask.play()
	stage_with_mask.play()
	get_mask.play()
	sad.play()
	happy.play()

func stop() -> void:
	title.stop()
	intro.stop()
	stage_without_mask.stop()
	stage_with_mask.stop()
	get_mask.stop()
	sad.stop()
	happy.stop()

func switch_track(track: Utilities.Track):
	match track:
		Utilities.Track.TITLE:
			title.volume_db = -8.0
			intro.volume_db = -80.0
			stage_without_mask.volume_db = -80.0
			stage_with_mask.volume_db = -80.0
			get_mask.volume_db = -80.0
			sad.volume_db = -80.0
			happy.volume_db = -80.0
		Utilities.Track.INTRO:
			title.volume_db = -80.0
			intro.volume_db = -8.0
			stage_without_mask.volume_db = -80.0
			stage_with_mask.volume_db = -80.0
			get_mask.volume_db = -80.0
			sad.volume_db = -80.0
			happy.volume_db = -80.0
		Utilities.Track.STAGE_WITH_MASK:
			title.volume_db = -80.0
			intro.volume_db = -80.0
			stage_without_mask.volume_db = -80.0
			stage_with_mask.volume_db = -8.0
			get_mask.volume_db = -80.0
			sad.volume_db = -80.0
			happy.volume_db = -80.0
		Utilities.Track.STAGE_WITHOUT_MASK:
			title.volume_db = -80.0
			intro.volume_db = -80.0
			stage_without_mask.volume_db = -8.0
			stage_with_mask.volume_db = -80.0
			get_mask.volume_db = -80.0
			sad.volume_db = -80.0
			happy.volume_db = -80.0
		Utilities.Track.GET_MASK:
			title.volume_db = -80.0
			intro.volume_db = -80.0
			stage_without_mask.volume_db = -80.0
			stage_with_mask.volume_db = -80.0
			get_mask.volume_db = -8.0
			sad.volume_db = -80.0
			happy.volume_db = -80.0
		Utilities.Track.SAD:
			title.volume_db = -80.0
			intro.volume_db = -80.0
			stage_without_mask.volume_db = -80.0
			stage_with_mask.volume_db = -80.0
			get_mask.volume_db = -80.0
			sad.volume_db = -8.0
			happy.volume_db = -80.0
		Utilities.Track.HAPPY:
			title.volume_db = -80.0
			intro.volume_db = -80.0
			stage_without_mask.volume_db = -80.0
			stage_with_mask.volume_db = -80.0
			get_mask.volume_db = -80.0
			sad.volume_db = -80.0
			happy.volume_db = -8.0
		

func sound(audio_stream: AudioStream, volume_db: float = 0.0, from: float = 0) -> SFX:
	var sfx: SFX = sfx_scene.instantiate()
	sfx.stream = audio_stream
	sfx.volume_db = volume_db
	sfx.from = from
	
	playing_sounds.add_child(sfx)
	
	return sfx

func play_iris_in() -> void:
	sound(iris_in, -13)
	
func play_iris_out() -> void:
	sound(iris_out, -13)

func play_mask_on() -> void:
	sound(mask_on, -6)
	
func play_mask_off() -> void:
	sound(mask_off, -6)

func play_pearl() -> void:
	sound(pearl_sfx, 0)

func play_death() -> void:
	sound(death_sfx, 0)
	
func play_fear() -> void:
	sound(fear_sfx, 0)

func play_jump1() -> void:
	sound(jump1_sfx, 0)

func play_jump2() -> void:
	sound(jump2_sfx, 0)

func play_jump3() -> void:
	sound(jump3_sfx, 0)

func play_jump_rr() -> void:
	if jump_rr == 1:
		play_jump1()
		jump_rr = 2
	elif jump_rr == 2:
		play_jump2()
		jump_rr = 3
	elif jump_rr == 3:
		play_jump3()
		jump_rr = 1
