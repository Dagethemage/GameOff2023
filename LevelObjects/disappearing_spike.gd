extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var silhouette = $Silhouette
@onready var collision_shape_2d = $HitBox/CollisionShape2D

@export var switch_type = SWITCH.ON

var timer = Timer.new()

enum SWITCH {ON , OFF}

func _ready() -> void:
	add_child(timer)

func _physics_process(delta) -> void:
	match switch_type:
		SWITCH.ON:
			silhouette.hide()
			sprite_2d.show()
			collision_shape_2d.call_deferred("is_disabled")
			collision_shape_2d.disabled = false
		SWITCH.OFF:
			silhouette.show()
			sprite_2d.hide()
			#collision_shape_2d.call_deferred("is_disabled")
			collision_shape_2d.disabled = true

	if Input.is_action_just_pressed("jump"):
		if switch_type == SWITCH.ON:
			switch_type = SWITCH.OFF
			print(switch_type)
		elif switch_type == SWITCH.OFF:
			switch_type = SWITCH.ON
			print(switch_type)
