extends Hand

var hand_animation: Animation
var move_sprite: Resource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos

func reveal_move() -> void:
	
	if GameHandling.move_played_by_p1: # else rock is played by default
		# loding the  texture that macthes the move played
		move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_p1])
		hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")

func hand_position() -> void:
	var initial_position = position
	var finial_position = Vector2(initial_position.x, initial_position.y + 50) # moving 50p down
	for i in range(7):
		if i%2 == 0:
			hand_animation.track_set_key_value(0, i, initial_position) # setting odd key to the initial values
		else:
			hand_animation.track_set_key_value(0, i, finial_position)
