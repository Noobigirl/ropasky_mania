extends CanvasLayer

var transition: AnimationPlayer

#func change_scene(path, from, transmit = null) -> void: # path to the new scene and scene from which we are changing it
	#transition  = $AnimationPlayer
	## playing the animation before changing the scene
	#transition.play(from.animation_in)
	#await  transition.animation_finished
	#
	#from.get_tree().call_deferred("change_scene_to_file", path)
	#transition.play(from.animation_out)

func change_scene(path, from, transmit = null) -> void:
	transition = $AnimationPlayer
	transition.play(from.animation_in)
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
	transition.play(from.animation_out)
