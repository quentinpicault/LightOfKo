class_name Shadow extends Node2D

@onready var state_machine = $ShadowStateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_position_changed(position: Transform2D) -> void:
	global_transform = position

func _on_player_facing_changed(facing: int) -> void:
	state_machine.change_facing(facing)

func _on_player_state_changed(state: int) -> void:
	state_machine.change_state(state)
