extends Control

@onready var pause_screen = $PauseScreen
@onready var main_menu_button = $PauseScreen/CenterContainer/MarginContainer/VBoxContainer/MainMenuButton
@onready var quit_button = $PauseScreen/CenterContainer/MarginContainer/VBoxContainer/QuitButton


var paused = false

func _ready() -> void:
	main_menu_button.pressed.connect(on_pressed)
	quit_button.pressed.connect(on_quit_pressed)

func _process(delta):
	if Input.is_action_just_pressed("start"):
		main_menu_button.grab_focus()
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

func on_quit_pressed():
	get_tree().quit()
