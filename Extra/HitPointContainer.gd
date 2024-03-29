extends HBoxContainer

@onready var health_point = preload("res://GUI/health_point.tscn")


func set_max_health_points(max_health_points: int):
	for i in range(max_health_points):
		var point = health_point.instantiate()
		add_child(point)

func update_health_points(current_health_points: int):
	var points = get_children()
	
	for i in range(current_health_points):
		points[i].update(true)
	for i in range(current_health_points, points.size()):
		points[i].update(false)
