extends Area2D

@onready var level_icon_panel = $LevelIconPanel
@onready var level_icon = $LevelIcon
@onready var label = $LevelIconPanel/Label
@onready var lock = $Lock
@onready var locked_icon = $LockedIcon
@onready var animation_player = $AnimationPlayer

@export var next_level:PackedScene

var show_icon = false
var unlocked = false
var timer = Timer.new()

func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		if self.name in Global.key_found:
			LevelTranstition.fade_to_black()
			await get_tree().create_timer(2).timeout
			LevelTranstition.fade_from_black()
			change_level()

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
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
	
	#Emits signal that the level has started
	Global.level_started.emit()


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
		level_icon_panel.show()
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

func change_level() -> void:
	if not next_level is PackedScene: return
	
		#Change to next_level if set in editor
	get_tree().change_scene_to_packed(next_level)
