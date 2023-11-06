extends Node

func save():
	var player_position : Vector2 = ReferenceStash.player.global_position
	var player_movement : PlayerMovementData = ReferenceStash.player_movement_data
	
	var save_data = {
		"player" : {
			"x" : player_position.x,
			"y" : player_position.y
		},
		"player_movement" : {
			"normal_speed" : player_movement.normal_speed,
			"dash_speed" : player_movement.dash_speed,
			"dash_length" : player_movement.dash_length,
			"acceleration" : player_movement.acceleration,
			"friction" : player_movement.friction,
			"jump_velocity" : player_movement.jump_velocity,
			"gravity_scale" : player_movement.gravity_scale,
			"air_resistance" : player_movement.air_resistance,
			"air_acceleration" : player_movement.air_acceleration,
		}
		
	}
	return save_data

func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_game().store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game().get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
