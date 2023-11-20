extends AreaSelectZone

func _unhandled_input(event):
	if event.is_action_pressed("Interact") and show_icon == true:
		await get_tree().create_timer(0.5).timeout
		await LevelTranstition.fade_to_black()
		await get_tree().create_timer(1.5).timeout
		await get_tree().create_timer(1.5).timeout
		LevelReferences.goto_scene("res://Levels/World3/level_3_1.tscn")
		LevelTranstition.fade_from_black()
