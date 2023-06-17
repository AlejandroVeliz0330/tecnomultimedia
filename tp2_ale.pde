float xPos = 400; // Posición inicial de los rombos 1
float xvel = 2; // Velocidad de movimiento de los rombos 1
float xPos2 = 400; // Posición inicial de los rombos 2
float xvel2 = 2; // Velocidad de movimiento de los rombos 2
boolean limiteReboteRombos = false; // Variable booleana para verificar el límite de rebote de los rombos
int colorRombos = color(230, 51, 117); // Color inicial de los rombos (rosa)

PImage Imagen;

void setup() {
  size(800, 400);
  Imagen = loadImage("imagentp2.jpg");
  frameRate(60);
  print(frameRate);
}

void draw() {
  image(Imagen, 45, 0);
  float BN = map(mouseX, 0, 800, 0, 255);
  fill(BN);
  rect(400, 0, 400, 400);

  // Actualiza la posición de los rombos 1
  xPos += xvel;

  // Verifica los límites de rebote en los bordes de la pantalla
  if (xPos <= 400 || xPos >= 550) {
    limiteReboteRombos = true; // Cambia el estado de la variable booleana
    xvel *= -1; // Cambia la dirección de movimiento
  }

  // Dibuja los rombos 1 en la nueva posición
  Rombos(xPos);

  // Actualiza la posición de los rombos 2
  xPos2 -= xvel2;

  // Verifica los límites de rebote en los bordes de la pantalla
  if (xPos2 <= 250 || xPos2 >= 400) {
    limiteReboteRombos = true; // Cambia el estado de la variable booleana
    xvel2 *= -1; // Cambia la dirección de movimiento
  }

  // Dibuja los rombos 2 en la nueva posición
  Rombos2(xPos2);

  // Cambio de color de los rombos al alcanzar los límites de rebote
  if (limiteReboteRombos) {
    if (colorRombos == color(230, 51, 117)) {
      colorRombos = color(255, 192, 203); // Cambia el color a rosado
    } else if (colorRombos == color(255, 192, 203)) {
      colorRombos = color(245, 124, 225); // Cambia el color a azul
    } else {
      colorRombos = color(230, 51, 117); // Cambia el color a fugcia
    }
    limiteReboteRombos = false; // Restablece el estado de la variable booleana
  }
  
  // Dibuja los triángulos fijos
  triangulo(400, 1);
  triangulo(400, 0);
}

void Rombos(float x) {
  pushMatrix();
  translate(x, 0);

  int rw = 150; // Ancho del romboide
  int rA = 55; // Altura del romboide
  int tA = 25; // Altura del triángulo
  int tb = tA * 2; // Base del triángulo (doble de la altura)

  // Dibuja el romboide en el lado izquierdo de la pantalla
  for (int y = 0; y < 400; y += rA - rA / 11) {
    for (x = 0; x < rw; x += rw + 10) {
      noStroke();
      fill(colorRombos); // Utiliza el color de los rombos
      quad(x, y, x + rw - rw / 5, y, x + rw + tA * 4, y + rA / 2, x + tb + rA, y + rA / 2);
    }
  }

  popMatrix();
}

void Rombos2(float x) {
  pushMatrix();
  translate(x, 0);

  int rw = 150; // Ancho del romboide
  int rA = 55; // Altura del romboide
  int tA = 25; // Altura del triángulo
  int tb = tA * 2; // Base del triángulo (doble de la altura)

  // Dibuja el romboide en el lado derecho de la pantalla
  for (int y = 25; y < 400; y += 50) {
    for (x = 55; x < rw + 200; x += rw + 150) {
      fill(colorRombos); // Utiliza el color de los rombos
      quad(x + 200, y, x + rw + rw + tb, y, x + tA + rw + tb, y + rA / 2, x - tA + tb + rA, y + rA / 2);
    }
  }

  popMatrix();
}

void triangulo(float x, int t) {
  pushMatrix();
  translate(x, 0);

  int tA = 25; // Altura del triángulo
  int tb = tA * 2; // Base del triángulo (doble de la altura)

  // Dibuja los triángulos en el lado derecho de la pantalla
  if (t == 1) {
    for (int y = 0; y < 400; y += tA + 25) {
      fill(230, 51, 117);
      triangle(400, y, 375 - tb - tA * 2, y + tA - tA, 400, y + tA);
    }
  }
  // Dibuja los triángulos en el lado izquierdo de la pantalla
  else {
    for (int y = 25; y < 400; y += tA + 25) {
      fill(230, 51, 117);
      triangle(0, y - 0 / 2, tb + tA * 2, y, 0, y + tA);
    }
  }

  popMatrix();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    xPos = 400; // Restablece la posición inicial de los rombos 1
    xvel = 2; // Restablece la velocidad de movimiento de los rombos 1
    xPos2 = 400; // Restablece la posición inicial de los rombos 2
    xvel2 = 2; // Restablece la velocidad de movimiento de los rombos 2
    limiteReboteRombos = false; // Restablece el estado de la variable booleana
    colorRombos = color(230, 51, 117); // Restablece el color de los rombos (rosa)
  }
}
