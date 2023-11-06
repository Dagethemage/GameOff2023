class_name WalkingEnemyBase
extends CharacterBody2D

@export var speed = 60.0
var facing_right: bool = true

@onready var ledge_check = $LedgeCheck

func _physics_process(delta):
	_ledge_check()
	move_and_slide()

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
	
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _ledge_check():
	if !ledge_check.is_colliding():
		flip()
	elif is_on_wall():
		flip()
	
	velocity.x = speed
