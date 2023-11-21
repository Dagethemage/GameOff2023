extends Panel

@onready var item_icon = $CenterContainer/Panel/ItemIcon

func _ready():
	pass

func update(slot: InventorySlot):
	if not slot.item:
		item_icon.visible = false
	else:
		item_icon.visible = true
		item_icon.texture = slot.item.icon
