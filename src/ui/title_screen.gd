extends Control

@onready var credits_screen = $CreditsScreen
@onready var credits_back = $CreditsScreen/Back

@onready var main_menu = $MainMenu
@onready var play = $MainMenu/Control/Menu/Play
@onready var credits = $MainMenu/Control/Menu/Credits
@onready var quit = $MainMenu/Control/Menu/Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play()
	AudioManager.switch_track(Utilities.Track.TITLE)
	
	play.action.connect(_on_accept_play)
	credits.action.connect(_on_accept_credits)
	quit.action.connect(_on_accept_quit)
	credits_back.action.connect(_on_accept_credits_back)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_accept_play() -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")

func _on_accept_credits() -> void:
	credits_screen.show()
	main_menu.hide()
	credits_back.grab_focus()
	
func _on_accept_credits_back() -> void:
	credits_screen.hide()
	main_menu.show()
	credits.grab_focus()

func _on_accept_quit() -> void:
	get_tree().quit()
