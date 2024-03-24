extends Node2D

func _ready() -> void:
	if self.name in Global.key_found:
		queue_free()
	print(Global.key_found)


func _on_area_2d_area_entered(area):
	Global.key_found.append(self.name)
	queue_free()
