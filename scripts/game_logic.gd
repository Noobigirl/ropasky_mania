extends Node

## --- storing all the moves 
var all_moves: Array = [ # change it to a dictionary and add path to the texture
	"rock",
	"paper",
	"scissors",
	"fire",
	"water",
	"sword",
	"shield",
	"corruption"
]

## --- Relationships between each move
var rock_set: Dictionary = {
	"beat": ["fire", "scissors"],
	"lose": ["water", "paper", "sword"],
	"tie": ["rock", "shield","corruption"],
}

var paper_set: Dictionary = {
	"beat": ["rock", "water", "shield"],
	"lose": ["fire", "scissors", "sword"],
	"tie": ["paper","corruption"],
}

var scissors_set: Dictionary = {
	"beat": ["paper", "shield"],
	"lose": ["rock", "fire", "sword"],
	"tie": ["scissors", "water", "corruption"],
}

var fire_set: Dictionary = {
	"beat": ["paper", "shield", "scissors"],
	"lose": ["rock", "water"],
	"tie": ["fire", "sword", "corruption"],
}

var water_set: Dictionary = {
	"beat": ["fire", "rock", "sword"],
	"lose": ["paper", "shield"],
	"tie": ["water", "scissors", "corruption"],
}

var sword_set: Dictionary = {
	"beat": ["Scissors", "Rock", "Paper"],
	"lose": ["Water", "Fire", "Shield"],
	"tie": ["Sword","corruption"],
}

var shield_set: Dictionary = {
	"beat": ["Water", "Sword"],
	"lose": ["Fire", "Paper", "Scissors"],
	"tie": ["Shield", "Rock", "corruption"],
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
