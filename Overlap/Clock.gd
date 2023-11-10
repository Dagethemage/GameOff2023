extends HBoxContainer

@onready var label = $Label
@onready var label_2 = $Label2

func _process(delta) ->void:
	Global.time += delta
	Global.msec = fmod(Global.time, 1) * 100
	Global.sec = fmod(Global.time, 60)
	
	label.text = "%02d." % Global.sec
	label_2.text = "%02d" % Global.msec

func stop():
	set_process(false)

func start():
	set_process(true)

func reset_timer():
	Global.time = 0.0


