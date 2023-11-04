class_name Action
extends Resource


signal finished

var _data: ActionData
var _actor
var _targets: Array = []

func _init(data: ActionData, actor, targets: Array) -> void:
	_data = data
	_actor = actor
	_targets = targets

func apply_async() -> bool:
	await Engine.get_main_loop().idle_frame
	finished.emit()
	return true

func get_ap_cost() -> int:
	return _data.ap_cost
