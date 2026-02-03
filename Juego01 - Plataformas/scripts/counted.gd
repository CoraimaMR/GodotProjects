extends CanvasLayer # Capa del HUD (siempre visible en pantalla)

# Label donde se muestra el contador de monedas
@onready var coin_label = $Control/Node2D/Label

# Actualiza el número de monedas en pantalla
func set_coins(amount):
	coin_label.text = str(amount)
