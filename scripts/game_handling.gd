extends Node

signal start_game
signal restart
signal score_changed
signal easy_mode_bot(player_move)
signal medium_mode_bot(last_player_move)
signal hard_mode_bot(last_player_move, wins, losses)
signal game_status(game_index, result) # signal sent when the winner of a game is deterined
signal update_text(text, audio)

var move_played_by_p1: String
var move_played_by_bot: String = "rock" # by default
var turn_number : int = 0 # number of turns since the begining of the game. 
var warning_update: Array # array storing the turn number and its outcome
# only allowing 3 
var player_corruption_left: int = 3
var bot_corrupton_left: int = 3

var end_game: Dictionary = {
	"won": 0.0,
	"lost": 0.0,
	"tie": 0.0,
}

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

func _ready() -> void:
	score_changed.connect(update_score)

func determine_winner() -> void:
	# --- getting the indexes of each move in the array
	if move_played_by_p1 == null:
		move_played_by_p1 = "rock" # defaulting to rock if no move is played
	
	var move_p1 = GameLogic.all_moves.find(move_played_by_p1)
	move_p1 = GameLogic.all_moves_list[move_p1] # getting the corresponding dictionary
	
	# --- determining the winner of the game
	if move_played_by_bot in move_p1["beat"]:
		print("player1 wins") # printing the winner's name for now
		game_status.emit(turn_number, "won")
		warning_update = ["[shake]You win[/shake]", 2]
		
	elif move_played_by_bot in move_p1["lose"]:
		print("bot wins")
		game_status.emit(turn_number, "lost")
		warning_update = ["[shake]You lose[/shake]", 3]
		
	else:
		print("tie")
		game_status.emit(turn_number, "tie")
		warning_update = ["[shake]Tie[/shake]", 1]
		
	turn_number += 1

func update_score() -> void:
	# passing through the new text and audiofile index
	update_text.emit(warning_update[0], warning_update[1])
