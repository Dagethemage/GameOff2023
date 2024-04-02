extends CanvasLayer

var is_open = false
#@onready var score_board = $ScoreBoard
@onready var coin_label = %CoinLabel
@onready var log_label = %LogLabel
@onready var level_completed = $LevelCompleted
@onready var animation_player = $AnimationPlayer
@onready var inventory = $Inventory
@onready var game_over_screen = $GameOverScreen

func _ready() -> void:
	close()
	Global.level_completed.connect(on_level_completed)
	Global.coins_changed.connect(coins_changed)
	Global.log_changed.connect(log_changed)
	Global.show_score.connect(show_score)
	Global.dead.connect(dead)

func _process(delta):
	if Input.is_action_just_pressed("Inventory"):
		
		if is_open:
			close()
			print("closed")
		else:
			open()
			print("opened")

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

func log_changed():
	log_label.text = str(Global._log)

func open():
	inventory.visible = true
	is_open = true

func close():
	inventory.visible = false
	is_open = false

func dead():
	game_over_screen.show()
