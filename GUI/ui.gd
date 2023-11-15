extends CanvasLayer

#@onready var timer = $Timer

var paused = false
@onready var coin_label = $CoinLabel
 

func _ready() -> void:
	Global.level_completed.connect(on_level_completed)
	Global.level_data.coins_changed.connect(coins_changed)


func on_level_completed():
	pass

func coins_changed():
	coin_label.text = str(Global.level_data.coin_amount)
