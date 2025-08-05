extends CanvasLayer

var transition: AnimationPlayer

func change_scene(path, from) -> void: # path to the new scene and scene from which we are changing it
	transition  = $AnimationPlayer
	# playing the animation before changing the scene
	transition.play(from.animation)
	await  transition.animation_finished
	
	from.get_tree().call_deferred("change_scene_to_file", path)
