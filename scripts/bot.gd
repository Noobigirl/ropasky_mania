extends Node

func _ready() -> void:
	#--- in easy mode, bot just chooses random move (for now)
	var move_to_play = GameLogic.all_moves.pick_random()
	GameHandling.move_played_by_bot = move_to_play
