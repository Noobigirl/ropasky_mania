extends Node2D

@export var player: PackedScene
@export var bot: PackedScene
var warning_text

func _ready() -> void:
	warning_text = $WarningText
	var player_hand = player.instantiate()
	var bot_hand = bot.instantiate()
	# --- Very important
	# I am setting the positions of the sprites to avoid "inconsistencies"
	bot_hand.sprite_position = $BotPosition.position
	player_hand.sprite_position = $PlayerPosition.position
	add_child(player_hand)
	add_child(bot_hand)
	MoveHandling.remove_text.connect(disapear)
	GameHandling.update_text.connect(update_warnig_text)
	

func disapear() ->void:
	self.remove_child(warning_text) # removing the text when the animation is playing

func update_warnig_text(text, audio) -> void:
	warning_text.change_text_audio(text, audio) # changing the text and the audio
	add_child(warning_text)
	warning_text.play_audio() # playing the new audio
	#GameHandling.restart.emit()
	

func reappear() ->void:
	pass
