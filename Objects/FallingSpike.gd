extends Node2D


@export var speed = 160.0
var current_speed = 0.0

@onready var hit_box = $HitBox
@onready var detect_zone = $DetectZone
@onready var spawn_position = global_position

func _ready() -> void:
	detect_zone.area_entered.connect(on_detect_zone)
	hit_box.area_entered.connect(on_hit_box)


func _physics_process(delta):
	position.y += current_speed * delta


func on_detect_zone(area):
	current_speed = speed
	await get_tree().create_timer(2).timeout
	position = spawn_position
	current_speed = 0
	
func on_hit_box():
	print("hit")
	queue_free()


