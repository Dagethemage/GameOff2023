extends Control


#@onready var inv: Inventory = preload("res://Resource/Player_item_inventory.tres")
#@onready var slots: Array = $ItemsMenu.get_children()


@onready var attack = $BattleMenu/Attack
@onready var skills = $BattleMenu/Skills
@onready var magic = $BattleMenu/Magic
@onready var items = $BattleMenu/Items

@onready var battle_menu = $BattleMenu
@onready var skill_menu = $SkillMenu
@onready var magic_menu = $MagicMenu
@onready var items_menu = $ItemsMenu


func _ready() -> void:
#	update_slots()
	attack.grab_focus()
	attack.pressed.connect(attack_button_pressed)
	skills.pressed.connect(skills_button_pressed)
	magic.pressed.connect(magic_button_pressed)
	items.pressed.connect(items_button_pressed)
#	print(inv.items)

#func update_slots():
#	for i in range(min(inv.items.size(), slots.size())):
#		slots[i].update(inv.items[1])

func attack_button_pressed():
	pass

func skills_button_pressed():
	battle_menu.hide()
	skill_menu.show()
	skill_menu.get_child(0).grab_focus()

func magic_button_pressed():
	battle_menu.hide()
	magic_menu.show()
	magic_menu.get_child(0).grab_focus()

func items_button_pressed():
	battle_menu.hide()
	items_menu.show()
	items_menu.get_child(0).grab_focus()

func _unhandled_input(event):
	if Input.is_action_just_pressed("Back"):
		battle_menu.show()
		attack.grab_focus()
		skill_menu.hide()
		magic_menu.hide()
		items_menu.hide()
