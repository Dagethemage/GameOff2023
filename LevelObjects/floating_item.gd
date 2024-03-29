class_name FloatingItem
extends Node2D

@export var item: Item

@onready var area_2d = $Marker2D/Area2D

var player = null

func _ready() -> void:
	area_2d.body_entered.connect(body_entered)

func body_entered(body):
	#player = body
	#Global._log += 1
	#player.collect(item)
	pass
