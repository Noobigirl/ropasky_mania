extends Node2D
@export var move_sprite: Resource
@export var hand_ID: int # differenciating player from bot
var hand_animation: Animation
var hand_texture
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MoveHandling.play_animation.connect(reveal_move)
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos
	

func reveal_move() -> void:
	# we only change the final texture if a move is played
	if hand_ID == 0: # player ID is 0
		if GameHandling.move_played_by_p1: # else rock is played by default
			# loding the  texture that macthes the move played
			move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_p1])
			hand_animation.track_set_key_value(1, 3, move_sprite)
	else:
		move_sprite = load(GameHandling.move_textures["paper"])
		hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
