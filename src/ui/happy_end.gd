extends Control

@onready var img0 = $Img0
@onready var img1 = $Img1
@onready var img2 = $Img2
@onready var img3 = $Img3
@onready var img4 = $Img4
@onready var img5 = $Img5
@onready var text0 = $Text0
@onready var text1 = $Text1
@onready var pearls = $Pearls

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play()
	AudioManager.switch_track(Utilities.Track.HAPPY)

	var tween_show_img0 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_img0.tween_property(img0, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.2).timeout

	var tween_show_text0 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_text0.tween_property(text0, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(7.0).timeout

	var tween_hide_text_0 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_hide_text_0.tween_property(text0, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.0).timeout

	var tween_show_img1 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_img1.tween_property(img1, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(2.4).timeout

	var tween_show_img2 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_img2.tween_property(img2, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.8).timeout

	var tween_show_img3 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_img3.tween_property(img3, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.8).timeout

	var tween_show_img4 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_img4.tween_property(img4, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.8).timeout

	var tween_show_img5 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_img5.tween_property(img5, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.2).timeout

	var tween_show_text1 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_text1.tween_property(text1, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(6.0).timeout

	var tween_hide_text1 = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_hide_text1.tween_property(text1, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.0).timeout

	var tween_show_pearls = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_show_pearls.tween_property(pearls, "modulate:a", 1.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(11.0).timeout

	var tween_hide_all = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween_hide_all.set_parallel(true)
	tween_hide_all.tween_property(img0, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween_hide_all.tween_property(img1, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween_hide_all.tween_property(img2, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween_hide_all.tween_property(img3, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween_hide_all.tween_property(img4, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween_hide_all.tween_property(img5, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween_hide_all.tween_property(pearls, "modulate:a", 0.0, 1.0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)

	await get_tree().create_timer(1.8).timeout

	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass