extends Node

@onready var music = $Music

var title_music = load("res://Sounds/TitleScreen.wav")

func play_title_music():
	music.stream = title_music
	music.play()
