extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var door = $Door

func _ready() -> void:
	animated_sprite_2d.play("Idle")
	door.area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	Global.level_completed.emit()
