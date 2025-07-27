extends Node2D

@export var move_sprite: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MoveHandling.play_animation.connect(reveal_move)

func reveal_move() -> void:
	$AnimationPlayer.play("reveal")
