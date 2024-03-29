extends Node2D

@onready var timer = $Timer
@onready var timer_2 = $Timer2

var dashing = false
var can_dash = true

func _ready() -> void:
	timer.timeout.connect(timeout)
	timer_2.timeout.connect(timeout_2)

func start_dash(duration):
	timer.wait_time = duration
	timer.start()
	can_dash = false

func is_dashing():
	return !timer.is_stopped()

func timeout():
	dashing = false

func timeout_2():
	can_dash = true
