class_name ActionData
extends Resource


@export var icon: Texture
@export var name: String

@export var ap_cost = 0

@export var is_targeting_self = false
@export var is_targeting_all = false

func can_be_used_by(battler) -> bool:
	return ap_cost <= battler.stats.ap
