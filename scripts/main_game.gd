extends Node2D

@export var player: PackedScene
@export var bot: PackedScene
var warning_text


func _ready() -> void:
	warning_text = $WarningText
	var player_hand = player.instantiate()
	var bot_hand = bot.instantiate()
	bot_hand.sprite_position = $BotPosition.position
	player_hand.sprite_position = $PlayerPosition.position
	add_child(player_hand)
	add_child(bot_hand)
	MoveHandling.play_animation.connect(disapear)
	GameHandling.update_text.connect(update_warnig_text)
	

func disapear() ->void:
	self.remove_child(warning_text) # removing the text when the animation is playing

func update_warnig_text(text, audio) -> void:
	warning_text.change_text(text)
	add_child(warning_text)
	

func reappear() ->void:
	pass
