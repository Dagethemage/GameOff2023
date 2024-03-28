extends IconState

func on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		LevelTranstition.fade_to_black()
		await LevelTranstition.fade_to_black()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_packed(icon_ui.level)
		LevelTranstition.fade_from_black()
		print("level change")
