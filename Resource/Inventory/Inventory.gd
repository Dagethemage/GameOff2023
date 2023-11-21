class_name Inventory
extends Resource

signal update

@export var item_slots: Array[InventorySlot]

func insert(item: Item):
	var slots = item_slots.filter(func(slot): return slot.item == item)
	if !slots.is_empty():
		slots[0].amount += 1
	else:
		var empty_slots = item_slots.filter(func (slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = 1
	update.emit()
