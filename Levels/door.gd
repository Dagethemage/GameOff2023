#Door node. Collision Mask should be on Interactables - Mask 8
class_name Door
extends Area2D



func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	Global.level_completed.emit()
	area.set_deferred("disabled", true)
