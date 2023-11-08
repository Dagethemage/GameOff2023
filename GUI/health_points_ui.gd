extends Control
@onready var hit_point_container = $HitPointContainer

@onready var stats = preload("res://Characters/Player/PlayerStats.tres")

func _ready() -> void:
	hit_point_container.set_max_health_points(stats.max_health)
	hit_point_container.update_health_points(stats.health)
	stats.health_changed.connect(hit_point_container.update_health_points)

func health_changed():
	hit_point_container.update_health_points(hit_point_container.current_health)
