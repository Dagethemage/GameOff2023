extends HBoxContainer

@onready var score_name_label = $ScoreNameLabel
@onready var score_label = $ScoreLabel

func set_player_score(score_value: String) -> void:
	score_label.text = score_value

func set_score_name(score_name: String) -> void:
	score_name_label.text = score_name
