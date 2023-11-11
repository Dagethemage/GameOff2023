extends Node




var score: int = 0: set = set_score
var time_score: int = 0: set = set_time_score
var coins: int = 0: set = set_coins
var retry: int = 0: set = set_retry
var retry_points: int = 500: set = set_retry_points
var time: float = 0.0
var sec: int = 0: set = set_sec
var msec: int = 0


signal score_changed
signal coins_changed
signal time_changed
signal time_score_changed
signal retry_changed
signal retry_points_changed

signal level_started
signal level_completed
signal level_ended
signal show_score
signal paused


func set_score(new_score):
	score = new_score
	score_changed.emit()

func set_coins(new_coins):
	coins = new_coins
	coins_changed.emit()

func set_sec(new_sec):
	sec = new_sec
	time_changed.emit()

func set_time_score(new_time_score):
	time_score = new_time_score
	time_score_changed.emit()

func set_retry(new_retry):
	retry = new_retry
	retry_changed.emit()

func set_retry_points(new_points):
	retry_points = new_points
	retry_points_changed.emit()
	
