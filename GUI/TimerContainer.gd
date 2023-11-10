extends HBoxContainer

@onready var timer_name_label = $TimerNameLabel
@onready var timer_score_label = $TimerScoreLabel

func _ready() -> void:
	Global.time_changed.connect(time_changed)

func time_changed() -> void:
	if Global.sec <= 5:
		Global.time_score = 500
	elif Global.sec >= 6:
		Global.time_score = 200
	timer_name_label.text = "Time"
	timer_score_label.text = "+" + str(Global.time_score)
	
	
	
