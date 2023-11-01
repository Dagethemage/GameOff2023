extends CharacterBody2D

var move_speed = 40

func _physics_process(delta):
	movement()

func movement():
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_input = Input.get_action_strength("down") - Input.get_action_strength("up")
	var move = Vector2(x_input, y_input)
	velocity = move.normalized()*move_speed
	move_and_slide()
	print(velocity)
	
