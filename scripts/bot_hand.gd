extends "res://scripts/hand.gd"



func _ready() -> void:
	super._ready()
	

func reveal_move() ->void:
	move_sprite = load(GameHandling.move_textures["paper"])
	hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
