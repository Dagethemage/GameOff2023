class_name Item
extends Resource

@export var item_name: String = "none"
@export var icon: Texture2D

func _init(itemName = "none"):
	item_name = itemName
