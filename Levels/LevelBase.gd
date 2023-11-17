extends Node2D

@export var next_level : PackedScene
@export var level_data: Resource
@onready var player = $Player

var player_postion = Vector2.ZERO


func _ready():
	Global.level_started.emit()
	player_postion = player.global_position
	Global.checkpoint_met.connect(checkpoint_met)
	Global.level_completed.connect(level_ended)

func checkpoint_met(checkpoint_position):
	Global.starting_position = checkpoint_position

func level_ended():
	get_tree().paused = true
	await get_tree().create_timer(3.0).timeout
	if not next_level is PackedScene: return
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(1.5).timeout
	get_tree().paused = false
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_packed(next_level)
	LevelTranstition.fade_from_black()
