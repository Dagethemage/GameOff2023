extends CharacterBody2D

@export var ACCELERATION = 300
@export var MAX_SPEED = 50
@export var FRICTION = 200
@export var WANDER_TARGET_RANGE = 4

@onready var wander_controller = $WanderController
@onready var sprite = $Sprite2D
@onready var player_detction_zone = $PlayerDetctionZone

var state = IDLE

enum{
	IDLE,
	WANDER,
	CHASE
}

func _ready() -> void:
	state = pick_random_state([IDLE, WANDER])

func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			
			if wander_controller.get_time_left() == 0:
				update_wander()
		WANDER:
			seek_player()
			if wander_controller.get_time_left() == 0:
				update_wander()
			
			accelerate_towards_point(wander_controller.target_position, delta)
			
			if global_position.distance_to(wander_controller.target_position) <= WANDER_TARGET_RANGE:
				update_wander()
			
		CHASE:
			var player = player_detction_zone.player
			if player != null:
				accelerate_towards_point(player.global_position, delta)
			else:
				state = IDLE
	move_and_slide()

func accelerate_towards_point(point, _delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * _delta)
	sprite.flip_h = velocity.x < 0

func seek_player():
	if player_detction_zone.can_see_player():
		state = CHASE

func update_wander():
	state = pick_random_state([IDLE, WANDER])
	wander_controller.start_wander_timer(randf_range(1, 3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
