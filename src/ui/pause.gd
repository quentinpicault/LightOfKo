extends Control

signal resume_game()

@onready var resume = $MainMenu/Menu/Resume
@onready var back_to_title = $MainMenu/Menu/BackToTitle

@export var PAUSED = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume.action.connect(_on_accept_resume)
	back_to_title.action.connect(_on_accept_back_to_title)

func _on_game_manager_paused() -> void:
	PAUSED = true
	resume.grab_focus()

func _on_accept_resume() -> void:
	PAUSED = false
	resume_game.emit()

func _on_accept_back_to_title() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	
func _input(event):
	if PAUSED and event.is_action_pressed("pause"):
		_on_accept_resume()
