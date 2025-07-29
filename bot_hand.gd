extends Hand

var hand_animation: Animation
var move_sprite: Resource
func _ready() -> void:
	super._ready()
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos

	

func reveal_move() ->void:
	move_sprite = load(GameHandling.move_textures["corruption"])
	hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
	# debugging
	print(GameHandling.move_played_by_bot)

func hand_position() -> void:
	var initial_position = position
	var finial_position = Vector2(initial_position.x, initial_position.y + 50) # moving 50p down
	for i in range(7):
		if i%2 == 0:
			hand_animation.track_set_key_value(0, i, initial_position) # setting odd key to the initial values
		else:
			hand_animation.track_set_key_value(0, i, finial_position)
