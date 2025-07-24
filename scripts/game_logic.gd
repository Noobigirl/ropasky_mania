extends Node

## --- storing all the moves 
var all_moves: Array = [
	"rock",
	"paper",
	"scissors",
	"fire",
	"water",
	"sword",
	"shield",
	"corruption"
]

## --- Relationships between each moves
var rock_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var paper_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var scissors_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var fire_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var water_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var sword_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var shield_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

var corruption_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": [],
}

## --- 
var all_moves_list: Array = [
	rock_set,
	paper_set,
	scissors_set,
	fire_set,
	water_set,
	sword_set,
	shield_set,
	corruption_set,
]

# this function will receive the moves of each player and return the winner or 0 if there is a tie
func who_won(curent_moves: Array):
	pass
	
