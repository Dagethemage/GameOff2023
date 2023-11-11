extends CanvasLayer

@onready var level_completed = $LevelCompleted
@onready var score_board = $ScoreBoard
@onready var score_board_bg = $ScoreBoardBg
@onready var timer = $Timer

var paused = false

func _ready() -> void:
	Global.level_completed.connect(on_level_completed)
	Global.show_score.connect(show_score)

func on_level_completed():
	timer.stop()
	level_completed.show()
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(level_completed, "position", Vector2(0,0), 1).from(Vector2(640, 0))
	await get_tree().create_timer(0.5).timeout
	timer.hide()
	await get_tree().create_timer(0.5).timeout
	Global.show_score.emit()

func show_score():
	score_board.show()
	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(score_board, "position", Vector2(640,180), 1).from(Vector2(900,180))
	tween.tween_property(score_board_bg, "position", Vector2(0,0), 1.2).from(Vector2(640, 0)) 


