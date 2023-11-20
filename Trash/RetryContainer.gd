extends HBoxContainer


@onready var retry_name_label = $RetryNameLabel
@onready var retry_score_label = $RetryScoreLabel

func _ready() -> void:
	Global.retry_points_changed.connect(retry_points_changed)
	retry_name_label.text = "Retrys"
	retry_score_label.text = "+" + str(Global.retry_points)


func retry_points_changed() -> void:
	retry_name_label.text = "Retrys"
	retry_score_label.text = "+" + str(Global.retry_points)
	

