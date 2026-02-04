<h1>JUEGO 01: PLATAFORMAS</h1>

<h2>1. Idea general</h2>
<p>Un juego de plataformas donde un champiñón va saltando y esquivando obstáculos para recolectar todas las monedas y poder pasar de nivel.</p>

<h2>2. Jugador</h2>
<p>Personaje visto desde un lateral. Se mueve en 2 direcciones.<br>
Controles:<br></p>
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

<h2>3. Mecánica principal</h2>
<p>Recolectar monedas: Las monedas aparecen en el mapa predeterminadamente. Cuando el jugador toca una moneda:<br>
 - La moneda desaparece.<br>
 - El jugador gana puntos.<br>
 - Suena un sonido simple.</p>

<h2>4. Monedas</h2>
<p>Cada moneda vale 1 punto y cuando se recojan todas en un tiempo límite se pasa de nivel.</p>

<h2>5. Puntuación</h2>
<p>Cada moneda suma puntos. La puntuación se muestra en pantalla a la par que se recolectan.</p>

<h2>6. Tiempo de juego</h2>
<p>Cada nivel dura 60 segundos. El tiempo se muestra en pantalla. Cuando el tiempo llega a 0:<br>
 - El juego termina.<br>
 - Se muestra la puntuación final.</p>

<h2>7. Pantallas del juego</h2>
<p><b>Pantallas del juego:</b><br></p>
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

<h2>8. Arte</h2>
<p>
  El arte ha sido descargado desde itch.io del creador <strong>kevins-moms-house</strong>. Los recursos están disponibles en estos enlaces:<br>
  <a href="https://kevins-moms-house.itch.io](https://kevins-moms-house.itch.io](https://kevins-moms-house.itch.io/four-seasons-platformer-tileset">enlace para los fondos</a> y 
  <a href="https://kevins-moms-house.itch.io](https://kevins-moms-house.itch.io](https://kevins-moms-house.itch.io/four-seasons-platformer-sprites">enlace para los personajes</a>.
</p>

<h2>7. Sonido</h2>
<p>Se pondra música simple al recolectar monedas, al inicio y final del juego.<br>
Creditos a <a href="https://www.patreon.com/posts/musica-y-sonidos-136243456?utm_medium=clipboard_copy&utm_source=copyLink&utm_campaign=postshare_creator&utm_content=join_link">Luis Canari</a>.</p>

<h2>8. Objetivo del proyecto</h2>
<p>Aprender:<br>
 - Movimiento del jugador<br>
 - Colisiones<br>
 - Contador de puntos<br>
 - Temporizador<br>
 - Cambiar escenas<br>
 - Sonidos<br>
Juego pequeño y terminable.</p>
