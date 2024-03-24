extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

@onready var path_follow_2d = $PathFollow2D
@onready var animated_sprite_2d = $AnimatableBody2D/AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

func _ready():
	animated_sprite_2d.play("Moving")
	if not loop:
		animation_player.play("Move")
		animation_player.speed_scale = speed
		set_process(false)

func _process(delta):
		path_follow_2d.progress += speed

