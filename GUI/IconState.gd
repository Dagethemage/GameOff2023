class_name IconState
extends Node

enum State {BASE, CLICKED, HOVER}

signal transition_requested(from: IconState, to: State)

@export var state: State

var icon_ui: LevelIconUI

func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass
