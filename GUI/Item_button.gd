extends Button

func update(item: Inventory):
	if !item:
		icon.visible = false
	else:
		icon.visible = true
