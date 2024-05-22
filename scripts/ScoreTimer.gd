extends Label

var time_passed:float = 0


func _process(delta):
	time_passed += delta
	text = "Time: %.2fs" % (time_passed)
