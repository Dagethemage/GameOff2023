extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var gpu_particles_2d = $GPUParticles2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready() -> void:
	Global.level_started.connect(level_started)


func fade_to_black():
	gpu_particles_2d.emitting = true
	animated_sprite_2d.show()
	animated_sprite_2d.play("default")
	animation_player.play("fade_to_black")
	await animation_player.animation_finished

func fade_from_black():
	animated_sprite_2d.hide()
	animation_player.play("fade_from_black")
	await animation_player.animation_finished

func level_started():
	gpu_particles_2d.emitting = false
