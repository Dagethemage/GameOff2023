extends CharacterBody2D

@export var stats : Resource
@export var MovementData : Resource

func _physics_process(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down")
	movement(input_vector)
	move_and_slide()
	
func movement(input_vector):
	velocity = input_vector * MovementData.speed




