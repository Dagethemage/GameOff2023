extends Node

@onready var music = $Music
@onready var music_bus = preload("res://Sounds/default_bus_layout.tres")

#Music
var title_music = load("res://Sounds/TitleScreen.wav")
var level_1_music = load("res://Sounds/Level1.wav")

#Sound Effects
var select = load("res://Sounds/Select.wav")

func play_title_music():
	music.stream = title_music
	music.play()

func play_level_1_music():
	music.stream = level_1_music 
	music.play()

func play_select_sound():
	select.play()
