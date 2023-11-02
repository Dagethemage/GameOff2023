extends Area2D

var player = null

func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	

func can_see_player():
	return player != null

func on_body_entered(body):
	player = body
	EventBus.battle_started.emit()

func on_body_exited(body):
	player = null
