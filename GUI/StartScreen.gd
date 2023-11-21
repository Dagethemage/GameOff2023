extends CanvasLayer

@onready var hub_world = load("res://Levels/hub_world.tscn")
@onready var start_button = $OptionsContainer/StartButton
@onready var quit_button = $OptionsContainer/QuitButton
@onready var press_a_button = $TitleContaner/VBoxContainer/PressAButton
@onready var animation_player = $AnimationPlayer

#sounds
@onready var select = $Select
@onready var start = $Start
@onready var error = $Error
@onready var back = $Back

func _ready() -> void:
	MusicController.play_title_music()
	press_a_button.grab_focus()
	press_a_button.pressed.connect(press_a_pressed)
	press_a_button.focus_entered.connect(a_focus_entered)
	start_button.focus_entered.connect(start_focus_entered)
	quit_button.focus_entered.connect(quit_focus_entered)
	start_button.pressed.connect(start_pressed)
	quit_button.pressed.connect(quit_pressed)

func press_a_pressed():
	start.play()
	animation_player.play("fade_in")
	await animation_player.animation_finished
	start_button.grab_focus()


func start_pressed():
	start.play()
	await get_tree().create_timer(1).timeout
	LevelTranstition.fade_to_black()
	await LevelTranstition.fade_to_black()
	await get_tree().create_timer(2).timeout
	LevelReferences.goto_scene("res://Levels/hub_world.tscn")
	LevelTranstition.fade_from_black()

func quit_pressed():
	back.play()
	await get_tree().create_timer(1).timeout
	get_tree().quit()

func a_focus_entered():
	select.play()

func start_focus_entered():
	select.play()

func quit_focus_entered():
	select.play()
