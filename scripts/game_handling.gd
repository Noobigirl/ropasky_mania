extends Node

var move_played_by_p1: String
var move_played_by_bot: String 

func determine_winner() -> void:
	# --- getting the indexes of each move in the array
	var move_p1 = GameLogic.all_moves.find(move_played_by_p1)
	move_p1 = GameLogic.all_moves_list[move_p1] # getting the corresponding dictionary
	
	# --- determining the winner of the game
	if move_played_by_bot in move_p1["beat"]:
		print("player1") # printing the winner's name for now
	elif move_played_by_bot in move_p1["lose"]:
		print("bot")
	else:
		print("tie")
