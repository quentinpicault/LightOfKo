class_name Mask extends Area2D

signal hit()

@onready var player = $"../../../LightWorld/Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	hit.connect(player._on_mask_hit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	queue_free()
