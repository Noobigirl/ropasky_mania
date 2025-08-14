extends Control

func _on_easy_play_button_pressed() -> void:
	MoveHandling.selected_mode = "easy"
	SceneManager.change_scene("res://scenes/Main_game.tscn", self)

func _on_medium_play_button_pressed() -> void:
	MoveHandling.selected_mode = "medium"
	SceneManager.change_scene("res://scenes/Main_game.tscn", self)
