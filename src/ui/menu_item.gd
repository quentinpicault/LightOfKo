extends HBoxContainer

signal action()

@export var FOCUS_ON_START = false

@onready var lock_left = $LockLeft
@onready var lock_right = $LockRight

func _ready():
	lock_left.hide()
	lock_right.hide()
	
	if FOCUS_ON_START:
		grab_focus()
		_on_focused()
	
	focus_entered.connect(_on_focused)
	focus_exited.connect(_on_unfocused)

func _on_focused():
	lock_left.show()
	lock_right.show()

func _on_unfocused():
	lock_left.hide()
	lock_right.hide()
	
func _gui_input(event):
	if event.is_action_pressed("ui_accept"):
		action.emit()
