class_name Stats
extends Resource

@export var health: int = 100: set = set_health
@export var mp: int = 75: set = set_mp
@export var ap: int = 3: set = set_ap
@export var defense: int = 25
@export var crit: int = 10
@export var crit_chance: int = 5

@export var max_health = 100
@export var max_ap = 3
@export var max_mp = 75

signal health_changed(value)
signal mp_changed(value)
signal ap_changed(value)

signal dead

#signal defense_changed(value)
#signal crit_changed(value)
#signal crit_chance_changed(value)

func set_health(new_health):
	health = new_health
	health = clamp(new_health, 0, max_health)
	if health <= 0:
		emit_signal("dead")

func set_mp(new_mp):
	mp = new_mp
	mp = clamp(new_mp, 0, max_mp)

func set_ap(new_ap):
	ap = new_ap
	ap = clamp(ap, 0, max_ap )
