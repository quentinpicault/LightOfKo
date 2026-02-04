class_name Pearl extends Area2D

signal pearl_collected(amount: int, position: Vector2)

@onready var player = $"../../../LightWorld/Player"
@onready var juice = $"../../../Juice"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_bobbing()
	body_entered.connect(_on_body_entered)
	pearl_collected.connect(player._on_pearl_pearl_collected)
	pearl_collected.connect(juice._on_pearl_pearl_collected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_bobbing():
	var duration = randf_range(0.8, 1.3)
	var start_delay = randf_range(0.0, duration)
	var tween = create_tween().set_loops()
	
	tween.tween_interval(start_delay)
	
	tween.tween_property(self, "position:y", self.position.y - 10, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
		
	tween.tween_property(self, "position:y", self.position.y, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

func _on_body_entered(body: Node2D) -> void:
	AudioManager.play_pearl()
	pearl_collected.emit(1, global_position)
	queue_free()
