extends Node2D

#Level Exports
@export var player: CharacterBody2D
#@export var audio_stream_player: AudioStreamPlayer


var player_postion = Vector2.ZERO
var timer = Timer.new()

func _ready():
	#Adds Timer to Scene Tree
	add_child(timer)
	#Signal for completing level
	Global.level_completed.connect(func level_completed():
		#sets timer properties when level is completed
		timer.one_shot = true
		timer.autostart = true
		timer.wait_time = 4.0
		timer.timeout.connect(func time_out():
			level_select_screen())
		timer.start()
		#Wait for the timeout signal to finish before changing scenes
		await timer.timeout
		)
	
	#Resets players position when reaching checkpoint to checkpoints current position
	Global.checkpoint_met.connect(func checkpoint_met(checkpoint_position):
		Global.starting_position = checkpoint_position)
	
	#Emits signal that the level has started
	Global.level_started.emit()
	
	#Stores the players postion on start
	player_postion = player.global_position

func level_select_screen() -> void:
	LevelTranstition.fade_to_black()
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://GUI/level_select.tscn")
	LevelTranstition.fade_from_black()
	
	


