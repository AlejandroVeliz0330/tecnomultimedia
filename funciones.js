function Menu() {
  // Dibuja elementos del menú, como botones de inicio y créditos
  image(Caratula, -100, 0);
  Caratula.resize(1000, 800);
  // Detecta teclas para cambiar de estado
  if (keyIsPressed && key === "Enter") {
    Estado = "juego";
    startJuego();
  } else if (keyIsPressed && key === "c") {
    Estado = "credits";
  }
}

function startJuego() {
  // Inicializa variables de juego y configura el juego
  obstaculo = [];
  autoX = width / 2;
  autoY = height - 50;
  EmpezarTiempo = millis();
  gameover = false;
}

function Juego() {
  textSize(22);
  fill(18, 74, 193);
  text("Sobrevive 60 \n  segundos\n para ganar", 35, 100);
  text("¡Usa la fechas \n        ← →  \npara moverte!", 30, 250);
  // Dibujar la carretera
  DibujarCamino();

  // Mover y dibujar los carriles
  moverCarriles(carrilesIzquierdos);
  moverCarriles(carrilesDerechos);
  dibujarCarriles(carrilesIzquierdos);
  dibujarCarriles(carrilesDerechos);

  // Crear y mover obstáculos
  if (frameCount % 60 === 0) {
    obstaculo.push(crearObstaculo());
  }

  for (let i = obstaculo.length - 1; i >= 0; i--) {
    obstaculo[i].y += velObstaculo;

    // Eliminar obstáculos fuera del lienzo
    if (obstaculo[i].y > height) {
      obstaculo.splice(i, 1);
    }

    // Verificar colisión con el coche
    if (
      !gameover &&
      checkColision(
      AutoColX,
      AutoColY,
      AnchoColAuto,
      AltoColAuto,
      obstaculo[i].x,
      obstaculo[i].y,
      AnchoColObstaculo,
      AltoColObstaculo
      )
      ) {
      // Handle collision (por ejemplo, detener el juego o reducir puntos de vida)
      console.log("¡Colisión con obstáculo! Perdiste el juego.");
      gameover = true;
      Estado = "gameover"; // Cambiar al estado de "Game Over"
    }

    dibujaObstaculo(obstaculo[i]);
  }

  // Mover y dibujar el auto
  moverAuto();
  dibujarAuto();

  // Calcular el tiempo transcurrido
  elapsedTime = (millis() - EmpezarTiempo) / 1000;

  // Verificar si has ganado
  if (elapsedTime >= winTime) {
    Estado = "Ganaste";
  }

  // Mostrar el tiempo transcurrido en segundos
  fill(0);
  textSize(20);
  text("Tiempo: " + floor(elapsedTime) + " s", 40, 30);
}

function DibujarCamino() {
  fill(80);
  rect(300, 0, 400, 800);
  fill(35, 216, 69);
  rect(200, 0, 100, 800);
  rect(700, 0, 100, 800);
  stroke(255);
  line(510, 800, 510, 0);
  line(490, 800, 490, 0);
}

function crearCarriles() {
 for (let y = 0; y < height; y += espaciadoCarril) {
    carrilesIzquierdos.push({
      x: 390, y: y, size: AltoCarril
    });
  }

 for (let y = 0; y < height; y += espaciadoCarril) {
    carrilesDerechos.push({
      x: 595, y: y, size: AltoCarril
    });
  }
}

function moverCarriles(carriles) {
  for (let i = 0; i < carriles.length; i++) {
    carriles[i].y += velCarril;

    if (carriles[i].y > height) {
      carriles[i].y = -AltoCarril;
    }
  }
}

function dibujarCarriles(carriles) {
  fill(245, 209, 112);
  for (let i = 0; i < carriles.length; i++) {
    rect(carriles[i].x, carriles[i].y, Anchocarril, carriles[i].size);
  }
}

function moverAuto() {
  if (keyIsDown(LEFT_ARROW)) {
    autoX = constrain(autoX - velAuto, 300 + anchoAuto / 2, 700 - anchoAuto / 2);
  }
  if (keyIsDown(RIGHT_ARROW)) {
    autoX = constrain(autoX + velAuto, 300 + anchoAuto / 2, 700 - anchoAuto / 2);
  }

  // Actualizar las propiedades de colisión del coche
  AutoColX = autoX;
  AutoColY = autoY - AltoColAuto / 2;
}

function dibujarAuto() {
  // Dibujar el cuadro de colisión del coche
  fill(255, 0, 0, 100); // Color rojo semitransparente
  rect(AutoColX - AnchoColAuto / 2, AutoColY, AnchoColAuto, AltoColAuto);

  // Dibujar la imagen del coche
  image(carImg, autoX - 75, autoY - 75, 150, 150);
}

function crearObstaculo() {
  return {
  x:
    random(300, 700 - AnchoObstaculo),
    y:
    0
  };
}

function dibujaObstaculo(obstaculo) {
  // Dibujar la imagen del obstáculo
  image(obsImg, obstaculo.x, obstaculo.y, AnchoObstaculo, AnchoObstaculo);
}

// Función de detección de colisiones entre dos rectángulos
function checkColision(x1, y1, w1, h1, x2, y2, w2, h2) {
  // Ajustar x2 para tener en cuenta el desplazamiento en x del cuadro de colisión del obstáculo
  x2 += 20;

  return x1 + w1 > x2 && x1 < x2 + w2 && y1 + h1 > y2 && y1 < y2 + h2;
}

function Creditos() {
  // Pantalla de créditos
  background(125, 172, 234);
  fill(255, 206, 0);
  textSize(52);
  text("Créditos", width / 2 - 100, height / 2 - 50);
  textSize(36);
  text("Desarrollado por: Alejandro Veliz", width / 2 - 250, height / 2);
  text("Tp4 tecnologia multimedial 1", width / 2 - 225, height / 2 + 50);
}

function dibujaGameover() {
  // Pantalla de juego terminado
  noStroke();
  background(227, 66, 66);
  fill(255, 206, 0);
  textSize(52);
  text("¡Game Over!", width / 2 - 150, height / 2);
  textSize(36);
  text("Presina R para volver a jugar", width / 2 - 225, height / 2 + 100);
}
function Ganar() {
  // Pantalla de juego terminado
  background(125, 172, 234);
  noStroke();
  fill(255, 206, 0);
  textSize(52);
  text("¡Ganaste!", width / 2 - 125, height / 2 - 150);
  textSize(36);
  text("¡Gracias por jugar!", width / 2 - 175, height / 2 );
  text("Presina R para volver a jugar", width / 2 - 250, height / 2 + 50);
}

function keyPressed() {
  // Detecta la tecla 'M' para volver al menú en cualquier estado
  if (key === "r") {
    Estado = "menu";
  }
}
