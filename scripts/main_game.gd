extends Node2D

@export var player: PackedScene
@export var bot: PackedScene


func _ready() -> void:
	var player_hand = player.instantiate()
	var bot_hand = bot.instantiate()
	bot_hand.sprite_position = $BotPosition.position
	player_hand.sprite_position = $PlayerPosition.position
	add_child(player_hand)
	add_child(bot_hand)
	
