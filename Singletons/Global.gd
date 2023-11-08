extends Node

var score: int = 0: set = set_score
var coins: int = 0: set = set_coins

signal score_changed
signal coins_changed

signal level_completed

func set_score(new_score):
	score = new_score
	emit_signal("score_changed")


func set_coins(new_coins):
	coins = new_coins
	emit_signal("coins_changed")
