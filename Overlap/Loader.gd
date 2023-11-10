extends Control

var progress = []
var scene_name
var scene_load_status = 0

@onready var label = $Label

func _ready():
	scene_name = "res://Levels/level_1.tscn"
	ResourceLoader.load_threaded_request(scene_name)

func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene_name,progress)
	label.text = str(floor(progress[0]*100)) + "%"
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var new_scene = ResourceLoader.load_threaded_get(scene_name)
		get_tree().change_scene_to_packed(new_scene)
