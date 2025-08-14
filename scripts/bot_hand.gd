extends Hand

var hand_animation: Animation
var move_sprite: Resource
var sprite_position: Vector2

func _ready() -> void:
	super._ready()
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos
	$Sprite2D.position = sprite_position

	GameHandling.restart.connect(reset_hand)


func reveal_move() ->void:
	move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_bot])
	hand_animation.track_set_key_value(1, 3, move_sprite) # setting the sprite in the animation
	$AnimationPlayer.play("reveal")
	BotLogic.check_first_turn()
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	GameHandling.score_changed.emit() # updating the warning text when the animation is over
	
func reset_hand() -> void:
	$Sprite2D.texture = load(GameHandling.move_textures["paper"])
