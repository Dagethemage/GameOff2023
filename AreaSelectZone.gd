extends Area2D

@onready var level_icon_panel = $LevelIconPanel
@onready var level_icon = $LevelIcon
@onready var label = $LevelIconPanel/Label
@export var next_level : PackedScene

var show_icon = false

func _unhandled_input(event):
	if event.is_action_pressed("Interact") and show_icon == true:
#		get_tree().paused = true
		await get_tree().create_timer(0.5).timeout
		if not next_level is PackedScene: return
		await LevelTranstition.fade_to_black()
		await get_tree().create_timer(1.5).timeout
#		get_tree().paused = false
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_packed(next_level)
		LevelTranstition.fade_from_black()

func _on_area_entered(area):
	level_icon.show()
	level_icon_panel.show()
	show_icon = true


func _on_area_exited(area):
	level_icon.hide()
	level_icon_panel.hide()