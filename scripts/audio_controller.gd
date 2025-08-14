extends Node

var active_stream: AudioStreamPlayer
signal play_main(audio_name)

func play_audio(audio_name: String = "Main") -> void:
	if active_stream:
		active_stream.stop()
		# stop playing the previous audio first
	active_stream = get_node(audio_name)
	print(active_stream)
	active_stream.play()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_main.connect(play_audio)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
