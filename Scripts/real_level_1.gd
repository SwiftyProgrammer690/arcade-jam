extends Node2D

@onready var label = %Label
const red = Color(1.0,0.0,0.0,1.0)
const green = Color(0.0, 1.0, 0.0, 1.0)
const target_time = 7.5
var stopwatch = 0.0

func _process(delta):
	stopwatch += delta
	
func _physics_process(delta):
	if (stopwatch > target_time):
		label.set("theme_override_colors/font_color", red)
	else:
		label.set("theme_override_colors/font_color", green)
	label.text = "Your Time: " + str(round(stopwatch)) + " seconds"

