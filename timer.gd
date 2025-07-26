extends Control

var timer: Node
var label: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = $Timer
	var label = $label


func update_text() -> void:
	#label.text = str(ceil(timer.time_left))
	print(timer.get_time_left())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_text()
