extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D
@onready var timer = $Timer

var ACCELERATION = 300
var MAX_SPEED = 50
var FRICTION = 200

var player = null
var scent = null

func _ready() -> void:
	seek_player_and_scent()



func _physics_process(delta) -> void:
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)ddad
	move_and_slide()

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)

func seek_player_and_scent():
	if !ray_cast_2d.is_colliding() and player != null:
		find_player()
		var dir = global_position.direction_to(player.global_position)
		velocity = dir * MAX_SPEED
	else:
		if ray_cast_2d.is_colliding():
			find_scent()

func timeout():
	pass

func find_player():
	var new_target: Node2D = null
	if ray_cast_2d.get_tree().get_nodes_in_group("player"):
		new_target = get_tree().get_nodes_in_group("player")[0]
		ray_cast_2d.target_position = (new_target.global_position - self.global_position)
		velocity = ray_cast_2d.target_position
		ray_cast_2d.force_raycast_update()
	return new_target

func find_scent():
	var new_target: Node2D = null
	if ray_cast_2d.get_tree().get_nodes_in_group("scent"):
		new_target = get_tree().get_nodes_in_group("scent")[0]
		ray_cast_2d.target_position = (new_target.global_position - self.global_position)
		ray_cast_2d.force_raycast_update()
		
	return new_target
