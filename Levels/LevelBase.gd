extends Node2D

#Level Exports
@export var player: CharacterBody2D
#@export var audio_stream_player: AudioStreamPlayer
#@export var next_level:PackedScene

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
		timer.wait_time = 1.0
		timer.timeout.connect(func time_out():
			change_level())
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

func change_level() -> void:
	#if not next_level is PackedScene: return
		##Change to next_level if set in editor
	#get_tree().change_scene_to_packed(next_level)
	pass

