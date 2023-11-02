extends Area2D

@onready var interact_label = $InteractLabel


func _ready():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)


func on_area_entered(area):
	interact_label.show()

func on_area_exited(area):
	interact_label.hide()
