extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var muzzel = $Muzzel
@onready var timer = $Timer


@export var shoot_speed: float = 0.0
@export var projectile: PackedScene

func _ready() -> void:
	timer.wait_time = shoot_speed
	timer.timeout.connect(on_timer_timeout)
	timer.start()

func shoot():
	var proj = projectile.instantiate()
	muzzel.add_child(proj)

func on_timer_timeout() -> void:
	shoot()

