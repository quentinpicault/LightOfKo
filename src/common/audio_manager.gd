extends Node

var jump_rr := 1

@onready var no_mask_music: AudioStreamPlayer = $NoMaskMusic
@onready var mask_music: AudioStreamPlayer = $MaskMusic
@onready var playing_sounds = $PlayingSounds

@export var sfx_scene: PackedScene
@export var mask_on: AudioStream
@export var mask_off: AudioStream
@export var pearl_sfx: AudioStream
@export var fear_sfx: AudioStream
@export var jump1_sfx: AudioStream
@export var jump2_sfx: AudioStream
@export var jump3_sfx: AudioStream

func _ready() -> void:
	no_mask_music.volume_db = -80.0
	mask_music.volume_db = -80.0
	
func play() -> void:
	no_mask_music.play()
	mask_music.play()
	
func switch_track(mask: bool):
	if mask:
		no_mask_music.volume_db = -80.0
		mask_music.volume_db = -8.0
	else:
		no_mask_music.volume_db = -8.0
		mask_music.volume_db = -80.0

func sound(audio_stream: AudioStream, volume_db: float = 0.0, from: float = 0) -> SFX:
	var sfx: SFX = sfx_scene.instantiate()
	sfx.stream = audio_stream
	sfx.volume_db = volume_db
	sfx.from = from
	
	playing_sounds.add_child(sfx)
	
	return sfx


func play_mask_on() -> void:
	sound(mask_on, -6)
	
func play_mask_off() -> void:
	sound(mask_off, -6)

func play_pearl() -> void:
	sound(pearl_sfx, 0)
	
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
