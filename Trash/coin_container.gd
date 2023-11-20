extends HBoxContainer

@onready var coin_name_label = $CoinNameLabel
@onready var coin_label = $CoinLabel

func _ready() -> void:
	Global.coins_changed.connect(coins_changed)

func coins_changed() -> void:
	coin_name_label.text = "Coins"
	coin_label.text = str(Global.coins)
