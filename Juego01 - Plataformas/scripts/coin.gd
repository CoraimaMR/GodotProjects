extends Area2D # COIN

# Referencias a nodos en la escena
@onready var animated_sprite = $AnimatedSprite2D # Sprite animado de la moneda
@onready var collision = $CollisionShape2D # Colisión de la moneda
@onready var pickup_sound = $Coin # Sonido que se reproduce al recoger

# Función que se llama cuando un cuerpo entra en el área
func _on_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		# Buscamos al dueño de la escena y sumamos la moneda allí
		var level = get_tree().current_scene
		if level.has_method("add_coin"):
			level.add_coin() 
			
		animated_sprite.visible = false # Oculta el sprite de la moneda
		collision.set_deferred("disabled", true)  # Cambio seguro de colisión
		pickup_sound.play() # Reproduce el sonido de recogida
		# Conectar señal para eliminar la moneda después de que termine el sonido
		pickup_sound.finished.connect(queue_free) # Cuando termine el sonido la moneda se borra
