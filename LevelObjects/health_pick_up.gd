extends FloatingItem

func body_entered(body):
	player = body
	Global.lives += 1
	queue_free()


