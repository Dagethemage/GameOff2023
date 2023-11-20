extends Area2D


func _ready():
	Global.level_completed.connect(level_ended)



func level_ended():
	get_tree().paused = true
	await get_tree().create_timer(3.0).timeout
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(1.5).timeout
	get_tree().paused = false
	await get_tree().create_timer(1.5).timeout
	LevelReferences.goto_scene("res://Levels/World2/level_2_2.tscn")
	LevelTranstition.fade_from_black()


func _on_area_entered(area):
	Global.level_completed.emit()
