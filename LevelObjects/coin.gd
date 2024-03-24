extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("Spin")
	area_entered.connect(on_area_entered)

func on_area_entered(area) -> void:
	Global.coin += 1
	print(Global.coin)
	queue_free()
