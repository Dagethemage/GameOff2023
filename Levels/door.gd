#Door node. Collision Mask should be on Interactables - Mask 8
class_name Door
extends Area2D

#Level Scene
@export var next_level:PackedScene

#Set Collision mask to 8 when entering scene and connects to 
#area_entered signal to change scene
func _ready() -> void:
	collision_mask = 8 #Interactables - Mask 8
	area_entered.connect(func on_area_entered():
		
		#If next_level isnt set in editor it returns null
		if not next_level is PackedScene: return
		
		#Change to next_level if set in editor
		get_tree().change_scene_to_packed(next_level))
