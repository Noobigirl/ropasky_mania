extends Node

signal stop_playing
signal play_animation

# the available moves will very depending on the difficulty levels
var available_moves = [
	"rock",
	"paper",
	"scissors",
]
