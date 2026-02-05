class_name Pearl extends Area2D

signal hit(amount: int, pearl_position: Vector2)

@onready var player = $"../../../../LightWorld/Player"
@onready var juice = $"../../../../Juice"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_bobbing()
	body_entered.connect(_on_body_entered)
	hit.connect(player._on_pearl_hit)
	hit.connect(juice._on_pearl_hit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_bobbing():
	var duration = randf_range(0.8, 1.3)
	var start_delay = randf_range(0.0, duration)

	var tween = create_tween()
	
	tween.set_loops()
	tween.tween_interval(start_delay)
	
	tween.tween_property(self, "position:y", self.position.y - 10, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
		
	tween.tween_property(self, "position:y", self.position.y, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

func _on_body_entered(body: Node2D) -> void:
	if visible:
		AudioManager.play_pearl()
		hit.emit(1, global_position)
		visible = false
