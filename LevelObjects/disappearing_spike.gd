extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var silhouette = $Silhouette
@onready var collision_shape_2d = $HitBox/CollisionShape2D

@export var switch_type = SWITCH.ON

enum SWITCH {ON , OFF}

func _physics_process(delta) -> void:
	match switch_type:
		SWITCH.ON:
			silhouette.hide()
			sprite_2d.show()
		SWITCH.OFF:
			silhouette.show()
			sprite_2d.hide()
			
	if Input.is_action_just_pressed("jump"):
		if switch_type == SWITCH.ON:
			switch_type = SWITCH.OFF
			print(switch_type)
		elif switch_type == SWITCH.OFF:
			switch_type = SWITCH.ON
			print(switch_type)
