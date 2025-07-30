extends Hand

var hand_animation: Animation
var move_sprite: Resource
var sprite_position: Vector2

func _ready() -> void:
	super._ready()
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos
	$Sprite2D.position = sprite_position

func reveal_move() -> void:
	if GameHandling.move_played_by_p1: # else rock is played by default
		# loding the  texture that macthes the move played
		move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_p1])
		hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
