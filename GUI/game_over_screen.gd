extends Control

@onready var retry = $VBoxContainer/Retry
@onready var main_menu = $VBoxContainer/MainMenu
@onready var quit = $VBoxContainer/Quit
@onready var select = $Select
@onready var animation_player = $AnimationPlayer

func _ready():
	Global.dead.connect(dead)
	retry.pressed.connect(retry_pressed)
	main_menu.pressed.connect(main_menu_pressed)
	quit.pressed.connect(quit_pressed)


func retry_pressed():
	LevelTranstition.fade_to_black()
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(2).timeout
	LevelTranstition.fade_from_black()
	get_tree().reload_current_scene()
	Global.lives = 3

func main_menu_pressed():
	LevelTranstition.fade_to_black()
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(2).timeout
	LevelTranstition.fade_from_black()
	get_tree().change_scene_to_file("res://GUI/start_screen.tscn")
	Global.lives = 3

func quit_pressed():
	get_tree().quit()

func dead():
	animation_player.play("fade_in")
