class_name LevelIconUI
extends Control

const BASE_PANEL_THEME := preload("res://GUI/Themes/level_panel_base_theme.tres")
const HOVER_PANEL_THEME := preload("res://GUI/Themes/level_panel_hover_theme.tres")

@onready var level_icon = $LevelIcon
@onready var icon = $LevelIcon/Icon
@onready var locked_icon = $LevelIcon/LockedIcon
@onready var lock = $LevelIcon/Lock
@onready var label = $LevelIcon/Label
@onready var animation_player = $LevelIcon/AnimationPlayer
@onready var level_icon_state_machine = $LevelIcon/LevelIconStateMachine as LevelIconStateMachine

@export_multiline var icon_tooltip_text: String

var tween: Tween

func _ready() -> void:
	gui_input.connect(on_gui_input)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	level_icon_state_machine.init(self)

func on_gui_input(event: InputEvent) -> void:
	level_icon_state_machine.on_gui_input(event)

func on_mouse_entered() -> void:
	level_icon_state_machine.on_mouse_entered()
	print("entered")

func on_mouse_exited() -> void:
	level_icon_state_machine.on_mouse_exited()
	print("exited")
