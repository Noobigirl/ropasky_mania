extends Control

@export var movebutton: PackedScene
var move_set = MoveHandling.mode["easy"] # easy mode by default

func set_move_set() -> void:
	if MoveHandling.selected_mode != "easy" :
		# choosing a random set of moves
		move_set = MoveHandling.mode[MoveHandling.selected_mode][randi() % MoveHandling.mode[MoveHandling.selected_mode].size()]
	

func create_button() -> void:
	set_move_set()
	for move in move_set: # creating a button for every move available
		var new_button = movebutton.instantiate()
		new_button.set_move(move) # setting the move logic and text
		$ScrollContainer/VBoxContainer.add_child(new_button) #adding the move to the scrollbar 

func _ready() -> void:
	create_button()
