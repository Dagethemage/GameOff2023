extends IconState

#test#
func enter() -> void:
	print("clicked")


func on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#transition to new level
		print("level change")
