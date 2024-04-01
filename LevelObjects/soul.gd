extends Node2D

@export var parent: CharacterBody2D
@onready var timer = $Timer
@onready var soul_position = parent.get_node("SoulPosition")

var vel = Vector2()
var speed: int = 100

func _ready() -> void:
	set_process(true)

func _process(delta) -> void:
	var target = soul_position.global_position
	if position.distance_to(target) > 5:
		vel = position.direction_to(target) * speed
		

func timeout():
	pass
