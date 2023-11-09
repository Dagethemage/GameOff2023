extends Node

var score: int = 0: set = set_score
var coins: int = 0: set = set_coins
var retry: int = 0: set = set_retry

signal score_changed
signal coins_changed
signal retry_changed

signal level_started
signal level_completed
signal level_ended
signal show_score

func set_score(new_score):
	score = new_score
	score_changed.emit()

func set_coins(new_coins):
	coins = new_coins
	coins_changed.emit()

func set_retry(new_retry):
	retry = new_retry
	retry_changed.emit()
