extends Node


var moves # easy mode moves
var move_set # other modes
var last_bot_move = ""
var last_move_set: Array


func _ready() -> void:
	# bot move determined each time the player selects a move
	GameHandling.easy_mode_bot.connect(easy_mode)
	GameHandling.medium_mode_bot.connect(medium_mode)

func establish_moves(selected_set: Array) ->void:
	# setting the available bot moves depending on the game mode
	moves = selected_set
	if MoveHandling.selected_mode != "easy":
		move_set =  selected_set

# -- helper function
func _set_bot_move(move_to_play) -> void:
	print("Bot plays: ", move_to_play)
	GameHandling.move_played_by_bot = move_to_play

### ----- Easy Mode bot AI

var first_turn = true

func check_first_turn() -> void:
	first_turn = !first_turn
	
func easy_mode(player_move: String):
	# - choosing a random move from rock, paper, and scissors on the first turn
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
		# First turn: choosing a random move
		last_bot_move = move_set[randi() % move_set.size()]
		_set_bot_move(last_bot_move)
		return

	var roll = randf() # drawing a float number between 0 and 1

	if roll < mistake_chance:
		# Pick something that LOSES to the player's last move
		last_bot_move = get_moves_that_lose_to(player_last_move)
		_set_bot_move(last_bot_move)

	elif roll < counter_chance + mistake_chance:
		# Pick something that BEATS the player's last move
		last_bot_move = get_moves_that_beat(player_last_move)
		_set_bot_move(last_bot_move)

	else:
		# Pick something else from the set
		var other_moves = move_set.duplicate()
		other_moves.erase(last_bot_move) # avoid repeating the bot's last move
		other_moves.erase(player_last_move) # avoid copying the player
		last_bot_move = pick_random(other_moves)
		_set_bot_move(last_bot_move)

# --- helper functions 
func pick_random(arr: Array) -> String:
	return arr[randi() % arr.size()]

func _get_move_data(move: String) -> Dictionary:
	var move_dict = GameLogic.all_moves.find(move)
	move_dict = GameLogic.all_moves_list[move_dict] # getting the corresponding dictionary
	return move_dict

func get_moves_that_beat(move: String, available_moves: Array = move_set) -> String:
	var move_data = _get_move_data(move)
	for m in move_data["beat"]:
		if m in available_moves:
			return m
	 # fallback in case something's off
	return available_moves[randi() % available_moves.size()]

func get_moves_that_lose_to(move: String, available_moves: Array = move_set) -> String:
	var move_data = _get_move_data(move)
	for m in move_data["lose"]:
		if m in available_moves:
			return m
	 # fallback in case something's off
	return available_moves[randi() % available_moves.size()]


### Hard mode bot AI

var hmistake_chance = 0.05
var corruption_chance = 0.2
var hcounter_chance = 0.7 # the rest is random
