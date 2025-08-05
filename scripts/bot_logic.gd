extends Node

var difficulty_level: String
var move_to_play: String


func _easy_mode() -> void:
	move_to_play = GameLogic.all_moves.pick_random() # picking a random move 
	#debugging
	print(move_to_play)
	GameHandling.move_played_by_bot = move_to_play
