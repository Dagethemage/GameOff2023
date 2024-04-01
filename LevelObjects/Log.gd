extends FloatingItem

func body_entered(body):
	player = body
	Global._log += 1
	player.collect(item)
	queue_free()
