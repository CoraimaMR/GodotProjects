# JUEGO 01: PLATAFORMAS

# 📖 Documento de Diseño de Juego (GDD)

## 1. Idea general 💡
<p>Un juego de plataformas donde un champiñón va saltando y esquivando obstáculos para recolectar todas las monedas y poder pasar de nivel.</p>

## 2. Jugador 🙍🏻‍♂️
Personaje visto desde un lateral. Se mueve en 2 direcciones.

Controles:
<table align="center">
  <thead>
    <tr>
      <th>Acción</th>
      <th>Controles</th>
      <th>Animación</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><b>Mover</b></td>
      <td><code>A</code> <code>D</code> / <code>←</code> <code>→</code></td>
      <td><code>walk</code></td>
    </tr>
    <tr>
      <td><b>Saltar</b></td>
      <td><code>W</code> <code>Espacio</code> / <code>↑</code></td>
      <td><code>jump</code></td>
    </tr>
    <tr>
      <td><b>Monedas</b></td>
      <td>Colisión automática</td>
      <td><code>add_coin()</code></td>
    </tr>
  </tbody>
</table>

## 3. Mecánica principal
Recolectar monedas: Las monedas aparecen en el mapa predeterminadamente. Cuando el jugador toca una moneda:

- La moneda desaparece.
- El jugador gana puntos.
- Suena un sonido simple.

## 4. Monedas y puntuación
Cada moneda vale 1 punto y cuando se recojan todas en un tiempo límite se pasa de nivel.
Cada moneda suma puntos. La puntuación se muestra en pantalla a la par que se recolectan.

## 5. Tiempo de juego
Cada nivel dura un tiempo predeterminado dependiendo de la dificultad El tiempo se muestra en pantalla. Cuando el tiempo llega a 0:

- El juego termina.
- Se muestra la puntuación final.

## 6. Pantallas del juego
Pantallas del juego:

<table align="center">
  <thead>
    <tr>
      <th>Pantalla</th>
      <th>Elementos y Funciones</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><b>Inicial</b></td>
      <td>▶️ Botón <code>Jugar</code></td>
    </tr>
    <tr>
      <td><b>Juego</b></td>
      <td>🕹️ Jugador | 🪙 Monedas | 🏆 Puntos | ⏱️ Tiempo</td>
    </tr>
    <tr>
      <td><b>Fin</b></td>
      <td>💀 "Fin del juego" | 🔢 Score final | 🔄 Botón <code>Volver</code></td>
    </tr>
  </tbody>
</table>

## 7. Créditos
El arte ha sido descargado desde itch.io del creador **kevins-moms-house**. Los recursos están disponibles en estos enlaces:[enlace para los fondos](https://kevins-moms-house.itch.io/four-seasons-platformer-tileset) y [enlace para los personajes](https://kevins-moms-house.itch.io/four-seasons-platformer-sprites).

La música simple de fondo y los sonidos se han descargado de este creador [Luis Canari](https://www.patreon.com/posts/musica-y-sonidos-136243456?utm_medium=clipboard_copy&utm_source=copyLink&utm_campaign=postshare_creator&utm_content=join_link).

## 7. Objetivo del proyecto
Aprender:

- Movimiento del jugador
- Colisiones
- Contador de puntos
- Temporizador
- Cambiar escenas
- Sonidos

Juego pequeño y terminable.</p>

---
_Documento actualizado a 05 de febrero de 2026 - Versión 1.3_
