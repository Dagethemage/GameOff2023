extends Control

@onready var inventory: Inventory = preload("res://Resource/Inventory/PlayerInventory.tres")
@onready var slots: Array = $ColorRect/CenterContainer/GridContainer.get_children()

func _ready():
	inventory.update.connect(update_slots)
	update_slots()

func update_slots():
	for i in range(min(inventory.item_slots.size(), slots.size())):
		slots[i].update(inventory.item_slots[i])
