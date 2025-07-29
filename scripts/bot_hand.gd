extends Hand


var move_sprite: Resource
func _ready() -> void:
	super._ready()

	

func reveal_move() ->void:
	move_sprite = load(GameHandling.move_textures["corruption"])
	hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
	# debugging
	print(GameHandling.move_played_by_bot)
