extends Node2D # BEE

# Área que impulsa al jugador hacia arriba
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		body.velocity.y = -300 # Aplica un impulso hacia arriba
		queue_free() # Se elimina tras usarse

# Área que mata al jugador
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over_menu.tscn") # Va al menu de derrota
