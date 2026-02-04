class_name SFX extends AudioStreamPlayer

var from: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finished.connect(queue_free)
	play(from)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
