extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var active = true

func _ready():
	area_entered.connect(on_area_entered)

func on_area_entered(area):
	if not active: return
	animated_sprite_2d.play("Reached")
	active = false
	Global.emit_signal("checkpoint_met", position)

