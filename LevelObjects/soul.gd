extends CharacterBody2D


@onready var timer = $Timer

var speed: int = 100

@onready var soul_marker = get_tree().get_first_node_in_group("soul_marker")

func _ready() -> void:
	pass

func _physics_process(delta) -> void:
	if soul_marker != null:
		var direction = global_position.direction_to(soul_marker.global_position).normalized()
		velocity = direction * speed
		move_and_slide()

func timeout():
	pass
