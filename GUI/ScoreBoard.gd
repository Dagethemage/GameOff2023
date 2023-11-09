extends Panel

@onready var score_box = $VBoxContainer/ScoreBox
@onready var v_box_container = $VBoxContainer/FinalScoreContainer/VBoxContainer


var row_1 = preload("res://GUI/coin_container.tscn").instantiate()
var row_2 = preload("res://GUI/score_container.tscn").instantiate()

func _ready() -> void:
	Global.show_score.connect(show_score)
	add_row(Global.coins)
	add_final_row(Global.score)


func add_row(coin_name) -> void:
	score_box.add_child(row_1)

func add_final_row(score_name) -> void:
	v_box_container.add_child(row_2)

func show_score():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_parallel(true)
	tween.tween_property(row_1, "position", Vector2(0, 0), 0.6).from(Vector2(300,0))
	tween.tween_property(row_2, "position", Vector2(0, 0), 0.7).from(Vector2(300,0))
	await get_tree().create_timer(3).timeout
	Global.level_ended.emit()

