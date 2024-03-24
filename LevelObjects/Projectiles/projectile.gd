extends Area2D

@export var damage: int = 10
@export var speed: int = 300
@onready var sprite_2d = $Sprite2D

@onready var timer = $Timer
@onready var destroy_timer = $DestroyTimer

@export var direction = Vector2()

func _ready() -> void:
	destroy_timer.start()
	area_entered.connect(_area_entered)
	body_entered.connect(_body_entered)
	destroy_timer.timeout.connect(destroy_timer_timeout)
	timer.timeout.connect(_timeout)

func _physics_process(delta) -> void:
	var movement = direction * speed * delta
	global_position += movement

func _body_entered():
	pass

func _area_entered():
	pass

func destroy_timer_timeout():
	queue_free()

func _timeout():
	pass
