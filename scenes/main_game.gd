extends Node2D

@export var player: PackedScene
@export var bot: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_hand = player.instantiate()
	var bot_hand = bot.instantiate()
	player_hand.global_position = $"player position".position
	bot_hand.global_position = $"Bot position".position
	#player_hand.hand_position()
	#bot_hand.hand_position()
	add_child(player_hand)
	add_child(bot_hand)
	
	#$Bot._hand_positon()
	#$Player._hand_positon()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
