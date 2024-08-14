extends Node2D

@onready var label = %Label
@onready var result_label = %ResultLabel
@onready var lose_music

const red = Color(1.0,0.0,0.0,1.0)
const green = Color(0.0, 1.0, 0.0, 1.0)
const target_time = 7.5
var stopwatch = 0.0

#func play_lose_sfx():
	#sfx_player.stream = sound
	#sfx_player.play()

func _ready():
	if (get_tree().paused):
		get_tree().paused = false

func _process(delta):
	stopwatch += delta
	
func _physics_process(delta):
	if (stopwatch > target_time):
		label.set("theme_override_colors/font_color", red)
		result_label.set("theme_override_colors/font_color", red)
		result_label.text = "Result: Loss"
		$RealGameMusic.stop()

		get_tree().paused = true
		await get_tree().create_timer(4).timeout
		get_tree().reload_current_scene()
	else:
		label.set("theme_override_colors/font_color", green)
	label.text = "Your Time: " + str(round(stopwatch)) + " seconds"

