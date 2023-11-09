extends ColorRect

@onready var resume_button = $CenterContainer/MarginContainer/VBoxContainer/VBoxContainer/ResumeButton
@onready var menu_button = $CenterContainer/MarginContainer/VBoxContainer/VBoxContainer/MenuButton
@onready var quit_button = $CenterContainer/MarginContainer/VBoxContainer/VBoxContainer/QuitButton


func _ready():
	resume_button.grab_focus()
	resume_button.pressed.connect(resume_pressed)
	menu_button.pressed.connect(menu_pressed)
	quit_button.pressed.connect(quit_pressed)

func resume_pressed():
	get_tree().paused = false
	hide()


func menu_pressed():
	get_tree().change_scene_to_file("res://GUI/start_screen.tscn")

func quit_pressed():
	get_tree().quit()



