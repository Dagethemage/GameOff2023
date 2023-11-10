extends Control

@onready var pause_screen = $PauseScreen

var paused = false

func _process(delta):
	if Input.is_action_just_pressed("start"):
		pause_menu()

func pause_menu():
	if paused:
		pause_screen.hide()
		Engine.time_scale = 1
	else:
		pause_screen.show()
		Engine.time_scale = 0
	
	paused = !paused
