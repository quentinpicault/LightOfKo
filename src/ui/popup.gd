extends Control

signal action()

@export var OPENED = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if OPENED and event.is_action_pressed("ui_accept"):
		close()
		action.emit()

func open() -> void:
	OPENED = true

func close() -> void:
	OPENED = false
