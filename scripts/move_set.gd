extends Control

@export var movebutton: PackedScene

func create_button() -> void:
	for move in MoveHandling.available_moves: # creating a button for every move available
		var new_button = movebutton.instantiate()
		new_button.set_move(move) # setting the move logic and text
		$ScrollContainer/VBoxContainer.add_child(new_button) #adding the move to the scrollbar 

func _ready() -> void:
	create_button()
