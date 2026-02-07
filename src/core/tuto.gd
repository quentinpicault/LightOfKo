extends Node2D

@onready var keyboard = $Keyboard
@onready var joypad = $Joypad

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_input_manager_type_changed(InputManager.current_type)
	InputManager.type_changed.connect(_on_input_manager_type_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_manager_type_changed(type: Utilities.InputType) -> void:
	keyboard.visible = type == Utilities.InputType.KEYBOARD
	joypad.visible = type == Utilities.InputType.JOYPAD
