extends Node2D # Nodo con dos áreas: una que impulsa al jugador y otra que mata

# Área que impulsa al jugador hacia arriba
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		body.velocity.y = -300 # Aplica un impulso hacia arriba
		queue_free() # Se elimina tras usarse

# Función que se llama cuando un cuerpo entra en el área
func _on_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene") # Reinicia la escena
