class_name PlayerCamera
extends Camera2D

@export var player: CharacterBody2D
@export var tilemap: TileMap

func _ready():
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.rendering_quadrant_size
	var world_size = map_rect.size * tile_size
	
	limit_right = world_size.x
	limit_bottom = world_size.y
func _process(delta):
	position = player.position
	if Input.is_action_pressed("cam_down"):
		position.y = 50
	elif Input.is_action_pressed("cam_up"):
		position.y = -50
	else: position.y = 0


