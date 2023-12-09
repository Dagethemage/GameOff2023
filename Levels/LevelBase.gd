class_name LevelBase
extends Node2D

@export var player: CharacterBody2D
@export var audio_stream_player: AudioStreamPlayer

var player_postion = Vector2.ZERO

func _ready():
	Global.checkpoint_met.connect(func checkpoint_met(checkpoint_position):
		Global.starting_position = checkpoint_position)
	Global.level_started.emit()
	player_postion = player.global_position
