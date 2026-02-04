extends CanvasLayer  # Capa del HUD, siempre visible sin importar la cámara

@onready var coin_label = $Control/Node2D/Label # Referencia al Label que muestra el número de monedas

# Función para actualizar la cantidad de monedas en el HUD
func set_coins(amount):
	coin_label.text = str(amount)  # Convierte el número a texto y lo muestra
