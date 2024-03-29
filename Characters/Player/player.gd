extends CharacterBody2D

#Exported Resources
@export var MovementData : PlayerMovementData
@export var inventory: Inventory

var air_jump = false
var just_wall_jumped = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var was_wall_normal = Vector2.ZERO
var scent_trail = []

@onready var dash = $Dash
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var wall_jump_timer = $WallJumpTimer
@onready var coyote_jump_timer = $CoyoteJumpTimer
@onready var hazard_detector = $HazardDetector
@onready var scent_position = $ScentPosition
@onready var scent = preload("res://Overlap/Scent.tscn")
@onready var scent_timer = $ScentTimer

func _ready() -> void:
	scent_timer.timeout.connect(scent_timeout)
	Global.starting_position = global_position
	Global.level_completed.connect(func level_completed():
		MovementData.zero_stats())
	Global.level_started.connect(func level_started():
		MovementData.rest_stats())
	hazard_detector.area_entered.connect(hazard_detector_entered)

func _physics_process(delta):
	apply_gravity(delta)
	if Input.is_action_just_pressed("dash") and dash.can_dash:
		dash.dashing = true
		dash.start_dash(MovementData.dash_length)
		dash.timer_2.start()
	handle_wall_jump()
	handle_jump()
	var input_axis = Input.get_axis("left", "right")
	handle_acceleration(input_axis, delta)
	handle_air_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	apply_air_resistance(input_axis, delta)
	update_animations(input_axis)
	var was_on_floor = is_on_floor()
	var was_on_wall = is_on_wall_only()
	if was_on_wall:
		was_wall_normal = get_wall_normal()
	move_and_slide()
	var just_left_ledge = was_on_floor and not is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		coyote_jump_timer.start()
	just_wall_jumped = false
	var just_left_wall = was_on_wall and not is_on_wall()
	if just_left_wall:
		wall_jump_timer.start()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * MovementData.gravity_scale * delta

func handle_wall_jump():
	if not is_on_wall_only() and wall_jump_timer.time_left <= 0.0: return
	var wall_normal = get_wall_normal()
	if wall_jump_timer.time_left> 0.0:
		wall_normal = was_wall_normal
	if Input.is_action_just_pressed("jump"):
		velocity.x = wall_normal.x * MovementData.normal_speed
		velocity.y = MovementData.jump_velocity
		just_wall_jumped = true

func handle_jump():
	if is_on_floor(): air_jump = true
	if is_on_floor() or coyote_jump_timer.time_left > 0.0:
		if Input.is_action_just_pressed("jump"):
			velocity.y = MovementData.jump_velocity
	elif not is_on_floor():
		if Input.is_action_just_released("jump") and velocity.y < MovementData.jump_velocity / 2:
			velocity.y = MovementData.jump_velocity / 2
		
		if Input.is_action_just_pressed("jump") and air_jump and not just_wall_jumped:
			velocity.y = MovementData.jump_velocity * 0.8 #20 percent reduction
			air_jump = false

func apply_friction(input_axis, delta):
	if input_axis == 0 and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, MovementData.friction * delta)

func apply_air_resistance(input_axis, delta):
	if input_axis == 0 and not is_on_floor():
		velocity.x = move_toward(velocity.x, 0, MovementData.air_resistance * delta)

func handle_acceleration(input_axis, delta):
	var speed = MovementData.dash_speed if dash.is_dashing() else MovementData.normal_speed
	if not is_on_floor()and !dash.is_dashing(): return
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, speed * input_axis, MovementData.acceleraton * delta)#speed instead of MovementData.normal_speed for dash

func handle_air_acceleration(input_axis, delta):
	var speed = MovementData.dash_speed if dash.is_dashing() else MovementData.normal_speed
	if is_on_floor() and !dash.is_dashing(): return
	if input_axis != 0:
		velocity.x = move_toward(velocity.x , speed * input_axis, MovementData.air_acceleration * delta)#speed instead of MovementData.normal_speed for dash

func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)
#		animated_sprite_2d.play("Run")
	else:
		animated_sprite_2d.play("Idle")

	if not is_on_floor():
		pass
#		animated_sprite_2d.play("Jump")

func hazard_detector_entered(area) -> void:
	MovementData.zero_stats()
	#play death animation
	#await get_tree().create_timer(0.5).timeout
	global_position = Global.starting_position
	await get_tree().create_timer(0.1).timeout
	MovementData.rest_stats()

func spawn_scent():
	var scent_spawn = scent.instantiate()
	get_parent().add_child(scent_spawn)
	scent_spawn.position = scent_position.global_position
	scent_trail.push_front(scent_spawn)

func scent_timeout():
	spawn_scent()

func collect(item):
	inventory.insert(item)



