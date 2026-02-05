extends Node2D # BEE

# Referencias a nodos en la escena
@onready var anim = $AnimatedSprite2D
@onready var path_follow = get_parent() as PathFollow2D

# Área que impulsa al jugador hacia arriba
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		for area in [$Area2D, $Area2D2]: # Desactiva las colisiones
			area.set_deferred("monitoring", false)
		path_follow.moving = false # Detener movimiento
		body.velocity.y = -300 # Aplica un impulso hacia arriba
		queue_free() # Se elimina tras usarse

# Área que mata al jugador
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over_menu.tscn") # Va al menu de derrota
