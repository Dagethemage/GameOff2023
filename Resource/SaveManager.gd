extends Node

var save_file_path = "user://save/"
var save_file_name = "PlayerSave.tres"

var player_movement_data = PlayerMovementData.new()

func _ready():
	verify_save_directory(save_file_path)

func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)

func _load():
	player_movement_data = ResourceLoader.load(save_file_path + save_file_name).duplicate(true)

func _save():
	ResourceSaver.save(player_movement_data, save_file_path + save_file_name)

#testing
func add_item_pressed():
	player_movement_data.add_item_to_inventory("blunt")
