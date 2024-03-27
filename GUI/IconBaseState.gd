extends IconState

func enter() -> void:
	icon_ui.level_icon.set("theme_override_styles/panel", icon_ui.BASE_PANEL_THEME)


func on_mouse_entered() -> void:
	icon_ui.level_icon.set("theme_override_styles/panel", icon_ui.HOVER_PANEL_THEME)

func on_mouse_exited() -> void:
	icon_ui.level_icon.set("theme_override_styles/panel", icon_ui.BASE_PANEL_THEME)
