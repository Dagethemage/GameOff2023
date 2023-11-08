class_name CharacterStats
extends Resource

@export var health: int = 5: set = set_health

var max_health = 5

signal health_changed(value)
signal dead

func set_health(new_health):
	health = new_health
	health = clamp(new_health, 0, max_health)
	if health <= 0:
		emit_signal("dead")
	health_changed.emit(new_health)
