extends Button

func update(item: Inventory):
	if !item:return
	else:
		text = item.name
