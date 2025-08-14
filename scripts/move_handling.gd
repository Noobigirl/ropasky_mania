extends Node

signal stop_playing
signal play_animation
signal remove_text

var selected_mode = "easy" # by default

var mode : Dictionary = {
	"easy" : ["rock", "paper","scissors"],
	"medium" : [ # balanced moves allowed in medium mode
				["rock", "scissors", "paper", "water"],
				["fire", "scissors", "shield", "water"],
				["sword", "rock", "fire", "paper"],
				["shield", "sword", "paper", "fire"],
				["water", "sword", "rock", "fire"]
	],
	"hard" : []
}


#Added
#Initial move list: Rock, Paper, Scissors, Fire, Water, Sword, Shield
#
#Introduced special move: Corruption (3-use, always ties)
#
#Changed
#Balanced move logic to reflect realistic outcomes (e.g. water rusts sword, fire melts scissors)
#
#Shield now logically beats water and rock, loses to sharp/hot elements
#
#Fixed
#Removed illogical matchups (e.g. sword losing to rock or tying with paper)
#
#Notes
#Reworked the ruleset for intuitive strategy and consistent thematic logic
#
#Planning to add UI mockup and single-player mode in next version
