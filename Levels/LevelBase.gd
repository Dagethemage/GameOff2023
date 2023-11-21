extends Node2D
@onready var player = $Player

var player_postion = Vector2.ZERO

func _ready():
	Global.level_started.emit()
	player_postion = player.global_position
	Global.checkpoint_met.connect(checkpoint_met)


func checkpoint_met(checkpoint_position):
	Global.starting_position = checkpoint_position


