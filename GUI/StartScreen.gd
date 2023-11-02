extends CenterContainer

@onready var start = $MarginContainer/VBoxContainer/Start
@onready var options = $MarginContainer/VBoxContainer/Options
@onready var quit = $MarginContainer/VBoxContainer/Quit



func _ready() -> void:
	start.grab_focus()
	start.pressed.connect(start_pressed)
	options.pressed.connect(options_pressed)
	quit.pressed.connect(quit_pressed)

func start_pressed():
	get_tree().change_scene_to_file("res://Levels/World.tscn")

func options_pressed():
	pass

func quit_pressed():
	get_tree().quit()
