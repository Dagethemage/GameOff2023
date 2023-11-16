extends CanvasLayer

@onready var start_button = $CenterContainer/MarginContainer/VBoxContainer/VBoxContainer2/StartButton
@onready var quit_button = $CenterContainer/MarginContainer/VBoxContainer/VBoxContainer2/QuitButton

func _ready() -> void:
	start_button.grab_focus()
	start_button.pressed.connect(start_pressed)
	quit_button.pressed.connect(quit_pressed)

func start_pressed():
	await get_tree().create_timer(1).timeout
	LevelTranstition.fade_to_black()
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file("res://Levels/level_6.tscn")
	LevelTranstition.fade_from_black()

func quit_pressed():
	get_tree().quit()
