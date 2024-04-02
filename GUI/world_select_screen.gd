extends Control

@onready var back = $Back

func _input(event):
	if event.is_action_pressed("Back"):
		back.play()
		LevelTranstition.fade_to_black()
		await LevelTranstition.fade_to_black()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://GUI/start_screen.tscn")
		LevelTranstition.fade_from_black()
