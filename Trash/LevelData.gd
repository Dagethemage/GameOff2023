class_name LevelData
extends Resource

@export var level_name: String = ""
@export var coin_amount: int = 0: set = set_coin

signal coins_changed

func set_coin(new_coin):
	coin_amount = new_coin
	coins_changed.emit()
