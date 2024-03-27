class_name LevelIconStateMachine
extends Node

@export var initial_state: IconState

var current_state: IconState
var states := {}

func init(icon: LevelIconUI) -> void:
	for child in get_children():
		if child is IconState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.icon_ui = icon
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

func _on_transition_requested(from: IconState, to: IconState.State) -> void:
	if from != current_state:
		return
	
	var new_state: IconState = states[to]
	if not new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state
