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
	"beat": ["fire", "scissors"],
	"lose": ["water", "paper", "sword"],
	"tie": ["rock", "shield"],
}

var paper_set: Dictionary = {
	"beat": ["rock", "water", "shield"],
	"lose": ["fire", "scissors", "sword"],
	"tie": ["paper"],
}

var scissors_set: Dictionary = {
	"beat": ["paper", "shield"],
	"lose": ["rock", "fire", "sword"],
	"tie": ["scissors", "water"],
}

var fire_set: Dictionary = {
	"beat": ["paper", "shield", "scissors"],
	"lose": ["rock", "water"],
	"tie": ["fire", "sword"],
}

var water_set: Dictionary = {
	"beat": ["fire", "rock", "sword"],
	"lose": ["paper", "shield"],
	"tie": ["water", "scissors"],
}

var sword_set: Dictionary = {
	"beat": ["Scissors", "Rock", "Paper"],
	"lose": ["Water", "Fire", "Shield"],
	"tie": ["Sword"],
}

var shield_set: Dictionary = {
	"beat": ["Water", "Sword"],
	"lose": ["Fire", "Paper", "Scissors"],
	"tie": ["Shield", "Rock" ],
}

var corruption_set: Dictionary = {
	"beat": [],
	"lose": [],
	"tie": ["Rock", "Paper", "Scissors", "Fire", "Water", "Sword", "Shield", "Corruption"],
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
	
