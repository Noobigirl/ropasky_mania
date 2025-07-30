extends Hand

var hand_animation: Animation
var move_sprite: Resource
var sprite_position: Vector2

func _ready() -> void:
	super._ready()
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos
	$Sprite2D.position = sprite_position
	BotLogic._easy_mode()

func reveal_move() ->void:
	move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_bot])
	hand_animation.track_set_key_value(1, 3, move_sprite)
	$AnimationPlayer.play("reveal")
	
