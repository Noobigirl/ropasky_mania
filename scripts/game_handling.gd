extends Node

signal start_game
signal restart
signal game_status(game_index, result) # signal sent when the winner of a game is deterined
signal update_text(text, audio)

var move_played_by_p1: String
var move_played_by_bot: String 
var turn_number : int = 0 # number of turns

var move_textures: Dictionary = {
	"rock": "res://assets/sprites/hands/rock.png",
	"paper": "res://assets/sprites/hands/paper.png",
	"scissors": "res://assets/sprites/hands/scissors.png",
	"fire": "res://assets/sprites/hands/fire.png",
	"water": "res://assets/sprites/hands/water.png",
	"sword": "res://assets/sprites/hands/sword.png",
	"shield": "res://assets/sprites/hands/shield.png",
	"corruption": "res://assets/sprites/hands/corruption.png",
	
}

func determine_winner() -> void:
	# --- getting the indexes of each move in the array
	if move_played_by_p1 == null:
		move_played_by_p1 = "rock" # defaulting to rock if no move is played
	
	var move_p1 = GameLogic.all_moves.find(move_played_by_p1)
	move_p1 = GameLogic.all_moves_list[move_p1] # getting the corresponding dictionary
	
	# --- determining the winner of the game
	if move_played_by_bot in move_p1["beat"]:
		print("player1 wins") # printing the winner's name for now
		game_status.emit(turn_number, "beat")
		update_text.emit("You win", " ")
		
	elif move_played_by_bot in move_p1["lose"]:
		print("bot wins")
		game_status.emit(turn_number, "lose")
		update_text.emit("You lose", " ")
		
	else:
		print("tie")
		game_status.emit(turn_number, "tie")
		update_text.emit("Tie", " ")
		
	turn_number += 1
	#restart.emit()
	
func replay() -> void:
	pass
