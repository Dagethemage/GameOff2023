extends Node2D

@export var next_level : PackedScene


func _ready():
	Global.coins = 0
	Global.score = 0
	Global.time = 0.0
	Global.time_score = 0
	Global.level_completed.connect(level_ended)


func level_ended():
	get_tree().paused = true
	await get_tree().create_timer(5.0).timeout
	if not next_level is PackedScene: return
	await LevelTranstition.fade_to_black()
	get_tree().paused = false
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_packed(next_level)
	LevelTranstition.fade_from_black()
