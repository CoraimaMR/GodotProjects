extends Control # Menú de inicio

func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/map1.tscn") # Empieza el nivel 1
