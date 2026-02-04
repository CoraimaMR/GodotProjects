extends Area2D  # Área que detecta colisiones con el jugador (moneda)

# Referencias a nodos dentro del área
@onready var animated_sprite = $AnimatedSprite2D # Sprite animado de la moneda
@onready var collision = $CollisionShape2D # Colisión de la moneda
@onready var pickup_sound = $Coin # Sonido que se reproduce al recoger

# Función que se llama cuando un cuerpo entra en el área
func _on_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		body.add_coin() # Llama a la función para sumar monedas al jugador
		animated_sprite.visible = false # Oculta el sprite de la moneda
		collision.set_deferred("disabled", true)  # Cambio seguro de colisión
		pickup_sound.play() # Reproduce el sonido de recogida
		# Conectar señal para eliminar la moneda después de que termine el sonido
		pickup_sound.finished.connect(_on_sound_finished)

# Función que se llama cuando el sonido termina de reproducirse
func _on_sound_finished():
	queue_free()  # Elimina la moneda de la escena
