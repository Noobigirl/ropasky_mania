extends Control

var timer
var label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	label = $Label
	timer.start()
	$AudioStreamPlayer.play()

func update_text() -> void:
	label.text = str(ceili(timer.time_left))
	# ceili is used to round the time left to the to the nearest int (upwards)
	
func _process(delta: float) -> void:
	update_text()

func _on_timer_timeout() -> void:
	$AudioStreamPlayer.stop()
	MoveHandling.stop_playing.emit() # preventing the player to choose another move when the timer is over
	#label.visible = false
