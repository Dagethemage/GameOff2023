extends Node

var coin: int = 0: set = set_coin
var _log: int = 0: set = set_log
var lives: int = 3
var starting_position
var key_found = []
var log_found = []
var opened_door = []

var full_health_sprite = load("res://Characters/Player/player_full_health.tres")
var half_health_sprite = load("res://Characters/Player/player_half_health.tres")
var low_health_sprite = load("res://Characters/Player/player_low_health.tres")

signal coins_changed
signal log_changed
signal time_changed
signal time_score_changed
signal dead

signal level_started
signal level_completed
signal show_score
signal level_ended
signal checkpoint_met(checkpoint_position)
signal paused

signal icon_tooltip_requested(icon: Icon)
signal tooltip_hide_requested

signal area_selected
#var level_data: LevelData = load("res://Resource/DefaultLevelData.tres")

func set_coin(new_coin):
	coin = new_coin
	coins_changed.emit()

func set_log(new_log):
	_log = new_log
	log_changed.emit()
