class_name LevelStats
extends Resource

var coins: int = 0: set = set_coins
var logs: int = 0: set = set_logs

signal coins_collected(value)
signal logs_collected(value)

func set_coins(new_value):
	coins = new_value
	coins_collected.emit(new_value)

func set_logs(new_value):
	logs = new_value
	logs_collected.emit(new_value)
