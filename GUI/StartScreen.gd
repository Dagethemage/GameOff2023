extends CanvasLayer

@onready var start_button = $OptionsContainer/StartButton
@onready var quit_button = $OptionsContainer/QuitButton
@onready var press_a_button = $TitleContaner/VBoxContainer/PressAButton
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	press_a_button.grab_focus()
	press_a_button.pressed.connect(press_a_pressed)
	start_button.pressed.connect(start_pressed)
	quit_button.pressed.connect(quit_pressed)

func press_a_pressed():
	animation_player.play("fade_in")
	await animation_player.animation_finished
	start_button.grab_focus()


func start_pressed():
	await get_tree().create_timer(1).timeout
	LevelTranstition.fade_to_black()
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Levels/World1/level_1.tscn")
	LevelTranstition.fade_from_black()

func quit_pressed():
	get_tree().quit()
