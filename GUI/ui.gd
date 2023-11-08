extends CanvasLayer

@onready var level_completed = $LevelCompleted
@onready var score_board = $ScoreBoard

func _ready() -> void:
	Global.level_completed.connect(on_level_completed)

func on_level_completed():
	score_board.show()
	level_completed.show()

