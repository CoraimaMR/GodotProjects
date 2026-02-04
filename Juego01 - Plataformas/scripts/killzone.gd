extends Area2D # Área que reinicia la escena al tocarla el jugador

# Función que se llama cuando un cuerpo entra en el área
func _on_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		# Recarga la escena actual (muerte / reinicio)
		get_tree().call_deferred("reload_current_scene")
