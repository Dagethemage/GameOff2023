class_name AreaSelectZone
extends Area2D

@onready var level_icon_panel = $LevelIconPanel
@onready var level_icon = $LevelIcon
@onready var label = $LevelIconPanel/Label
@onready var lock = $Lock
@onready var locked_icon = $LockedIcon
@onready var animation_player = $AnimationPlayer

var show_icon = false
var unlocked = false

#func _unhandled_input(event):
	#if event.is_action_pressed("Interact") and show_icon == true:
		#await get_tree().create_timer(0.5).timeout
		#await LevelTranstition.fade_to_black()
		#await get_tree().create_timer(1.5).timeout
		#await get_tree().create_timer(1.5).timeout
		#LevelReferences.goto_scene(next_level)
		#LevelTranstition.fade_from_black()

func _on_area_entered(area):
	if self.name in Global.key_found:
		Global.opened_door.append(self.name)
		if unlocked == false:
			locked_icon.show()
			lock.show()
			animation_player.play("Unlock")
			await  animation_player.animation_finished
			unlocked = true
		show_icon = true
		level_icon.show()
		locked_icon.hide()
		lock.hide()
	
	
	if not self.name in Global.key_found:
		level_icon_panel.show()
		lock.show()
		locked_icon.show()
		show_icon = true


func _on_area_exited(area):
	level_icon.hide()
	level_icon_panel.hide()
	lock.hide()
	locked_icon.hide()
