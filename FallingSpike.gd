extends Node2D


const SPEED = 300.0

var triggered: bool = false
var _velocity = Vector2(0,2)
@onready var detect_zone = $DetectZone

func _ready() -> void:
	detect_zone.body_entered.connect(on_detect_zone)

func _process(delta):
	on_detect_zone()
	if triggered == true:
		position += _velocity * delta
		print("triggered")

func on_detect_zone():
	triggered == true
	
	
