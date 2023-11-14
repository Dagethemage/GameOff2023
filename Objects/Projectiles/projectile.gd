extends Area2D

@export var damage: int = 10
@export var speed: int = 300
@onready var sprite_2d = $Sprite2D

@onready var timer = $Timer

@export var direction = Vector2()

func _ready() -> void:

	area_entered.connect(_area_entered)
	timer.timeout.connect(_timeout)

func _physics_process(delta) -> void:
	var movement = direction * speed * delta
	global_position += movement


func _area_entered():
	pass

func _timeout():
	pass
