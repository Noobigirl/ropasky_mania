extends Node2D

#@export var hand_ID: int # differenciating player from bot
var hand_animation: Animation


func _ready() -> void:
	MoveHandling.play_animation.connect(reveal_move)
	MoveHandling.play_animation.connect(_hand_positon)
	hand_animation = $AnimationPlayer.get_animation("reveal") # fething the "reveal" animation infos

# --- makeing the animation independent of the current position
func _hand_positon()-> void:
	#var initial_position = position
	#var finial_position = Vector2(initial_position.x, initial_position.y + 50) # moving 50p down
	#for i in range(7):
		#if i%2 == 0:
			#hand_animation.track_set_key_value(0, i, initial_position) # setting odd key to the initial values
		#else:
			#hand_animation.track_set_key_value(0, i, finial_position)
	pass

func reveal_move() -> void:
	pass
	# we only change the final texture if a move is played
	#if hand_ID == 0: # player ID is 0
		#if GameHandling.move_played_by_p1: # else rock is played by default
			## loding the  texture that macthes the move played
			#move_sprite = load(GameHandling.move_textures[GameHandling.move_played_by_p1])
			#hand_animation.track_set_key_value(1, 3, move_sprite)
	#else:
		#move_sprite = load(GameHandling.move_textures["paper"])
		#hand_animation.track_set_key_value(1, 3, move_sprite)
	#$AnimationPlayer.play("reveal")
	
