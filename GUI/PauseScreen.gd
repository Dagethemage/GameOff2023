extends Control

@onready var pause_screen = $PauseScreen
@onready var button = $PauseScreen/CenterContainer/MarginContainer/VBoxContainer/Button

var paused = false

func _ready() -> void:
	button.pressed.connect(on_pressed)

func _process(delta):
	if Input.is_action_just_pressed("start"):
		button.grab_focus()
		pause_menu()

func pause_menu():
	if paused:
		pause_screen.hide()
		Engine.time_scale = 1
	else:
		pause_screen.show()
		Engine.time_scale = 0
		
	
	paused = !paused

func on_pressed():
	Engine.time_scale = 1
	var start_menu = load("res://GUI/start_screen.tscn")
	get_tree().change_scene_to_packed(start_menu)
