extends Node2D

@export var item: Item
var player = null

#func _on_area_2d_area_entered(area):
	#queue_free()


func _on_area_2d_body_entered(body):
	player = body
	Global._log += 1
	player.collect(item)
	queue_free()
