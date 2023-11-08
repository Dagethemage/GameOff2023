extends Panel

@onready var score_box = $VBoxContainer/ScoreBox
@onready var v_box_container = $VBoxContainer/FinalScoreContainer/VBoxContainer



func _ready() -> void:
	#testing purposes change values to match global or player values
	add_row("Coins -", "666")
	add_row("Time Left -", "10s")
	add_final_row("Final Score -", "99999")


func add_row(score_name: String, player_score: String) -> void:
	var row = preload("res://GUI/score_container.tscn").instantiate()
	score_box.add_child(row)
	row.set_score_name(score_name)
	row.set_player_score(player_score)

func add_final_row(score_name: String, player_score: String) -> void:
	var row = preload("res://GUI/score_container.tscn").instantiate()
	v_box_container.add_child(row)
	row.set_score_name(score_name)
	row.set_player_score(player_score)

