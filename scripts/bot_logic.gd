extends Node

var difficulty_level: String
var moves = MoveHandling.mode["easy"]
var last_bot_move = ""
#var move_to_play: String

# -- helper function
func _set_bot_move(move_to_play) -> void:
	print("Bot plays: ", move_to_play)
	GameHandling.move_played_by_bot = move_to_play

### ----- Easy Mode bot AI

var first_turn = true

func check_first_turn() -> void:
	first_turn = !first_turn
	
func easy_mode(player_move: String):
	# - choosing a random move from rock, paper, and scissors
	if first_turn:
		last_bot_move = moves[randi() % moves.size()]
		_set_bot_move(last_bot_move)
	else:
		if beats(last_bot_move, player_move):
			_set_bot_move(last_bot_move)
		# Keep same move if it beats the player
		else:
			# Choose a different move from last time
			var available_moves = moves.duplicate()
			available_moves.erase(last_bot_move)
			last_bot_move = available_moves[randi() % available_moves.size()]
			_set_bot_move(last_bot_move)


func beats(move_a: String, move_b: String) -> bool:
		if (move_a == "rock" and move_b == "scissors") or (move_a == "scissors" and move_b == "paper") or (move_a == "paper" and move_b == "rock"):
			return true
		else: 
			return false



### --- Medium mode bot AI

var mistake_chance = 0.15
var counter_chance = 0.6

func medium_mode(player_last_move: String):
	if player_last_move == "":
		# First turn: totally random
		last_bot_move = moves[randi() % moves.size()]
		_set_bot_move(last_bot_move)

	var roll = randf()

	if roll < mistake_chance:
		# Pick something that LOSES to the player's last move
		var losing_moves = get_moves_that_lose_to(player_last_move)
		last_bot_move = pick_random(losing_moves)
		_set_bot_move(last_bot_move)

	elif roll < counter_chance + mistake_chance:
		# Pick something that BEATS the player's last move
		var winning_moves = get_moves_that_beat(player_last_move)
		last_bot_move = pick_random(winning_moves)
		_set_bot_move(last_bot_move)

	else:
		# Pick something else from the set
		var other_moves = moves.duplicate()
		other_moves.erase(last_bot_move)
		last_bot_move = pick_random(other_moves)
		_set_bot_move(last_bot_move)

func pick_random(arr: Array) -> String:
	return arr[randi() % arr.size()]

func get_moves_that_beat(move: String) -> Array:
	match move:
		"rock": return ["paper"]
		"paper": return ["scissors"]
		"scissors": return ["rock"]
		"water": return ["rock"] # Example - use your actual dictionary
		_:
			return []

func get_moves_that_lose_to(move: String) -> Array:
	match move:
		"rock": return ["scissors"]
		"paper": return ["rock"]
		"scissors": return ["paper"]
		"water": return ["paper"] # Example - use your actual dictionary
		_:
			return []
