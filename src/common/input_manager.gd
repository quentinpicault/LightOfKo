extends Node

signal type_changed(type: Utilities.InputType)

var current_type = Utilities.InputType.KEYBOARD

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		_update_type(Utilities.InputType.JOYPAD)
	elif event is InputEventKey or event is InputEventMouseButton:
		_update_type(Utilities.InputType.KEYBOARD)

func _update_type(new_type: Utilities.InputType) -> void:
	if current_type != new_type:
		current_type = new_type
		type_changed.emit(new_type)

func is_joypad() -> bool:
	return current_type == Utilities.InputType.JOYPAD
