class_name ToolTip
extends PanelContainer

@export var fade_seconds := 0.2

@onready var tool_tip_icon = %ToolTipIcon
@onready var tool_tip_text = %ToolTipText

var tween: Tween
var is_visiable = false

func _ready() -> void:
	Global.icon_tooltip_requested.connect(show_tooltip)
	Global.tooltip_hide_requested.connect(func hide_tooltip() -> void:
		is_visiable = false
		if tween:
			tween.kill()
			
		get_tree().create_timer(fade_seconds, false).timeout.connect(hide_animation))
	hide()

func hide_animation() -> void:
	if not is_visiable:
		tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "modulate", Color.TRANSPARENT, fade_seconds)
		tween.tween_callback(hide)

func show_tooltip(text: String) -> void:
		is_visiable = true
		if tween:
			tween.kill()
			
		tool_tip_text.text = text
		tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_callback(show)
		tween.tween_property(self, "modulate", Color.WHITE, fade_seconds)
