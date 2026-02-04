extends Control # Menú final

func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/map1.tscn") # Reintenta el nivel 1

func _on_button_2_pressed() -> void:
	get_tree().quit() # Sale del juego
