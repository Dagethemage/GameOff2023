extends Control

@onready var health_bar = $HealthBar

@onready var stats = preload("res://Resource/PlayerStats.tres")

func _ready() -> void:
	stats.health_changed.connect(health_changed)
#	stats.mp_changed.connect(mp_changed)
#	stats.ap_changed.connect(ap_changed)
	print(stats.health)

func _unhandled_input(event):
	if Input.is_action_pressed("ui_down"):
		stats.health -= 10
		print(stats.health)
	if Input.is_action_pressed("ui_up"):
		stats.health += 10

func health_changed(value):
	health_bar.value = stats.health

#func mp_changed(value):
#	pass
#
#func ap_changed(value):
#	pass
