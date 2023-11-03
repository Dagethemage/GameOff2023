extends Control

@onready var health_bar = $HealthBar
@onready var mana_bar = $ManaBar

@onready var stats = preload("res://Resource/PlayerStats.tres")

func _ready() -> void:
	stats.health_changed.connect(health_changed)
	stats.mp_changed.connect(mp_changed)
#	stats.ap_changed.connect(ap_changed)
	print(stats.health)
	print(stats.mp)

func health_changed(value):
	health_bar.value = stats.health

func mp_changed(value):
	mana_bar.value = stats.mp
#
#func ap_changed(value):
#	pass
