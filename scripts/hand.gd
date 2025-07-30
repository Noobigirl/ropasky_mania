class_name Hand
extends Node2D

func _ready() -> void:
	MoveHandling.play_animation.connect(reveal_move)
	


func reveal_move() -> void:
	pass # inherited scene  overwrite that

	
