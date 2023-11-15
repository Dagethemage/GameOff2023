extends Node

signal coins_changed
signal time_changed
signal time_score_changed

signal level_started
signal level_completed
signal level_ended
signal checkpoint_met(checkpoint_position)
signal paused

var starting_position

var level_data: LevelData = load("res://Resource/DefaultLevelData.tres")
