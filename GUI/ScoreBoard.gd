extends Panel

@onready var score_box = $VBoxContainer/ScoreBox
@onready var v_box_container = $VBoxContainer/FinalScoreContainer/VBoxContainer



func _ready() -> void:
	#testing purposes change values to match global or player values
	add_row(Global.coins)
	add_final_row(Global.score)


func add_row(coin_name) -> void:
	var row = preload("res://GUI/coin_container.tscn").instantiate()
	score_box.add_child(row)


func add_final_row(score_name) -> void:
	var row = preload("res://GUI/score_container.tscn").instantiate()
	v_box_container.add_child(row)

