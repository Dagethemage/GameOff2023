class_name PlayerCamera
extends Camera2D

func _ready():
	get_screen_center_position()

func _process(delta):
	if Input.is_action_pressed("cam_down"):
		position.y = 50
	elif Input.is_action_pressed("cam_up"):
		position.y = -50
	else: position.y = 0
