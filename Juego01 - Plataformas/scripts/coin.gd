extends Area2D # Área de detección de la moneda

# Se ejecuta cuando un cuerpo entra en el área
func _on_body_entered(body):
	if body.is_in_group("player"):
		# Si el cuerpo es el jugador
		body.add_coin() # Suma una moneda al jugador
		queue_free() # Elimina la moneda de la escena
