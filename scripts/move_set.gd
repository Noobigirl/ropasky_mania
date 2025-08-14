extends Control

@export var movebutton: PackedScene
var move_set #= MoveHandling.mode["easy"] # easy mode by default

func set_move_set() -> void:
	if MoveHandling.selected_mode != "easy" : # playing medium or hard mode
		if BotLogic.last_move_set: # when we are replaying
			move_set = BotLogic.last_move_set
			BotLogic.establish_moves(move_set) # passing the last set of moves
			return
		# choosing a new random set of moves among the available ones
		move_set = MoveHandling.mode[MoveHandling.selected_mode][randi() % MoveHandling.mode[MoveHandling.selected_mode].size()]
		BotLogic.last_move_set = move_set
	else:
			move_set = MoveHandling.mode["easy"]
	BotLogic.establish_moves(move_set)

func create_button() -> void:
	set_move_set()
	for move in move_set: # creating a button for every move available
		var new_button = movebutton.instantiate()
		new_button.set_move(move) # setting the move logic and text
		$ScrollContainer/VBoxContainer.add_child(new_button) #adding the move to the scrollbar 

func _ready() -> void:
	create_button()
