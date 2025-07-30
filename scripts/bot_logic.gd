extends Node

var difficulty_level: String
var move_to_play: String


func _easy_mode() -> void:
	move_to_play = GameLogic.all_moves.pick_random()
	#debugging
	print(move_to_play)
	GameHandling.move_played_by_bot = move_to_play



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
