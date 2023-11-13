extends Path2D



@onready var animation_player = $AnimationPlayer
@onready var detect_zone = $"Detect Zone"

func _ready() -> void:
	animation_player.is_playing(false)
	#add area2d named detect to detect moving platforms
	#add signal to detect_zone to signal when to play animations


