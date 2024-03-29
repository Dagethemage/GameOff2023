extends Node2D

@onready var timer = $Timer

func _ready() -> void:
	timer.timeout.connect(func timeout(): queue_free())
