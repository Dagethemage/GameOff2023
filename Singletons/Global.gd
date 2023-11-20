extends Node

var coin: int = 1
var starting_position
var key_found = []
var log_found = []
var opened_door = []


signal coins_changed
signal time_changed
signal time_score_changed

signal level_started
signal level_completed
signal show_score
signal level_ended
signal checkpoint_met(checkpoint_position)
signal paused

#var level_data: LevelData = load("res://Resource/DefaultLevelData.tres")

func set_coin(new_coin):
	coin = new_coin
	coins_changed.emit()
