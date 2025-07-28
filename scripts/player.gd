extends "res://scripts/hand.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()

func reveal_move() -> void:
	
	if GameHandling.move_played_by_p1: # else rock is played by default
		# loding the  texture that macthes the move played
		move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_p1])
		hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
