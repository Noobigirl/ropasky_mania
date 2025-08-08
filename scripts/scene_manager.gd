extends CanvasLayer

var transition: AnimationPlayer
var default: Array = ["swipe_in", "swipe_out"]
var animation_in
var animation_out

func change_scene(path, from, transmit = null) -> void:
	
	# checking if a particular animation should be played
	if "animation_in" in from:
		animation_in = from.animation_in
		animation_out = from.animation_out
	else:
		animation_in = default[0]
		animation_out = default[1]
		
	transition = $AnimationPlayer
	transition.play(animation_in)
	await transition.animation_finished
	
	if transmit !=null: 
		 # Manually instance the new scene
		var new_scene = load(path).instantiate()
		# Pass the variable if the new scene expects it
		new_scene.transmit = transmit

		# Change to the new scene
		get_tree().root.add_child(new_scene)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = new_scene
	else: 
		from.get_tree().call_deferred("change_scene_to_file", path)
		
	transition.play(animation_out)
