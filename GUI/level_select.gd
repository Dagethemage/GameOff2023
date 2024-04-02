extends Control

@onready var back = $Back

func _ready() -> void:
	for i in range($CenterContainer/Panel.get_child_count()):
		Global.levels.append(i+1)
	
	for level in $CenterContainer/Panel.get_children():
		if str_to_var(level.name) in range(Global.unlocked_levels + 1):
			level.visible = true
		else:
			level.visible = false

func _input(event):
	if event.is_action_pressed("Back"):
		back.play()
		LevelTranstition.fade_to_black()
		await LevelTranstition.fade_to_black()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://GUI/world_select_screen.tscn")
		LevelTranstition.fade_from_black()
