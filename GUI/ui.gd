extends CanvasLayer

@onready var score_board = $ScoreBoard
@onready var coin_label = $CoinLabel
 
func _ready() -> void:
	Global.level_completed.connect(on_level_completed)
	Global.coins_changed.connect(coins_changed)
	Global.show_score.connect(show_score)

func show_score():
	pass

func on_level_completed():
	pass

func coins_changed():
	coin_label.text = str(Global.coin)
