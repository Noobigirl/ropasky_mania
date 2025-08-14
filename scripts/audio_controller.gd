extends Node


func play_audio(audio_name: String) -> void:
	var active_stream = get_node(audio_name)
	print(active_stream)
	active_stream.play()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
