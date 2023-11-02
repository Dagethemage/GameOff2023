extends Node2D

@onready var gui = $GUI

func _ready() -> void:
	EventBus.battle_started.connect(battle_started)

func battle_started():
	gui.show()
