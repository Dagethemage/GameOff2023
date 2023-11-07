class_name PlayerMovementData
extends Resource

@export var normal_speed = 100.0
@export var dash_speed = 800.0
@export var dash_length = 0.12
@export var acceleraton = 800.0
@export var friction = 1000.0
@export var jump_velocity = -300.0
@export var gravity_scale = 1.0
@export var air_resistance = 200.0
@export var air_acceleration = 400.0







#testing only
@export var inventory = []

func add_item_to_inventory(item_name : String):
	inventory.append(Item.new(item_name))


