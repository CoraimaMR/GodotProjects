extends Area2D # Área que carga la escena al tocarla el jugador

# Función que se llama cuando un cuerpo entra en el área
func _on_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over_menu.tscn") # Va al menu de derrota
