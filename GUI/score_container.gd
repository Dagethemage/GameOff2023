extends HBoxContainer

@onready var score_name_label = $ScoreNameLabel
@onready var score_label = $ScoreLabel

func _ready() -> void:
	
	Global.score_changed.connect(score_changed)
	


func score_changed() -> void:
	score_name_label.text = "Final Score"
	score_label.text = str(Global.score)
	


