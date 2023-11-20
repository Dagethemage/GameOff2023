extends CanvasLayer

#@onready var score_board = $ScoreBoard

@onready var coin_label = $IconContainer/CoinLabel
@onready var log_label = $IconContainer/LogLabel
@onready var level_completed = $LevelCompleted
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	Global.level_completed.connect(on_level_completed)
	Global.coins_changed.connect(coins_changed)
	Global.show_score.connect(show_score)

func show_score():
	pass

func on_level_completed():
	animation_player.play("level_completed")
	await animation_player.animation_finished
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	#tween.set_parallel(true)
	tween.tween_property(level_completed, "position", Vector2(0,0), 1).from(Vector2(640, 0))
	await get_tree().create_timer(1).timeout
	Global.level_ended.emit()

func coins_changed():
	coin_label.text = str(Global.coin)
