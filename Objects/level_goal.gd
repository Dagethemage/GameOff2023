extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collectable_object = $CollectableObject


func _ready() -> void:
	animated_sprite_2d.play("Idle")
	collectable_object.area_entered.connect(area_entered)

func area_entered(area) -> void:
	Global.level_completed.emit()
	print("level completed")
