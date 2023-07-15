//link al video https://youtu.be/vk7jonfrIv4
int estado;  // la variable maestra que maneja el programa
boolean BotonIzquierda;
boolean BotonDerecha;
int textoPosY = -100;
PImage menu;
PImage P1;
PImage P2;
PImage P3;
PImage P4;
PImage P5;
PImage P6;
PImage P7;
PImage P8;
PImage P9;
PImage P10;
PImage P11;
PImage P12;
PImage P13;
PImage P14;
PImage P15;
PImage P16;
PImage P17;
PImage P18;
PImage end;
PImage creditos;
String[] textos;

void setup() {
  size(600, 600);
  estado = 0;  // 0 es menú
  BotonIzquierda = true;
  BotonDerecha = false;

  menu = loadImage("menu.png");
  P1 = loadImage("P1.jpg");
  P2 = loadImage("P2.jpg");
  P3 = loadImage("P3.jpg");
  P4 = loadImage("P4.jpg");
  P5 = loadImage("P5.jpg");
  P6 = loadImage("P6.jpg");
  P7 = loadImage("P7.jpg");
  P7 = loadImage("P7.jpg");
  P8 = loadImage("P8.jpg");
  P9 = loadImage("P9.jpg");
  P10 = loadImage("P10.jpg");
  P11 = loadImage("P11.jpg");
  P12 = loadImage("P12.jpg");
  P13 = loadImage("P13.jpg");
  P14 = loadImage("P14.jpg");
  P15 = loadImage("P15.jpg");
  P16 = loadImage("P16.jpg");
  P17 = loadImage("P17.jpg");
  P18 = loadImage("P18.jpg");
  end = loadImage("end.png");
  creditos = loadImage("creditos.png");
  textos = loadStrings("textos.txt");
}

void draw() {
  // Parte superior (imágenes)
  imageMode(CORNER);

  // Parte inferior (texto y botones)
  fill(243, 227, 196);
  rect(0, 300, 600, 300);

  switch (estado) {
  case 0:
    image(menu, 0, 0, 600, 600);
    textSize(40);
    textAlign(LEFT, CENTER);
    textSize(30);
    fill(200, 0, 0);
    text("presione el boton para continuar", 100, 400);
    // programar un over botón
    if (dist(mouseX, mouseY, 300, 500) <= 50) {
      fill(200, 0, 0);
    } else {
      fill(200);
    }
    circle(300, 500, 100);  // mi botón para empezar la aventura

    println("Estás en el menú");
    break;
  case 1:
    image(P1, 0, 0, 600, 300);
    stroke(0, 255, 0);
    fill(224, 2, 2);
    textSize(36);
    text(textos[0], 25, 20);  // Muestra el texto correspondiente del archivo
    textSize(16);
    fill(0);
    text(textos[1], 20, 275, 580, 150);
    text(textos[2], 20, 325, 580, 200);
    fill(20, 144, 34);
    text(textos[3], 20, 400, 580, 150);
    text(textos[4], 20, 425, 580, 150);
    noStroke();
    BotonesDobles();  // Dibuja los botones en las posiciones indicadas por mousePressed()

    println("P01");
    break;
  case 2:
    image(P2, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[5], 10, 300, 580, 150);
    BotonContinuar();
    println("P02");
    break;
  case 3:
    image(P3, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[6], 20, 300, 580, 150);
    BotonContinuar();
    println("P03");
    break;
  case 4:
    image(P4, 0, 0);
    stroke(0, 255, 0);
    fill(224, 2, 2);
    textSize(36);
    text(textos[7], 20, 20);  // Mostrar el texto correspondiente del archivo
    textAlign(LEFT, CENTER);
    textSize(18);
    fill(0);
    text(textos[8], 20, 275, 580, 150);
    text(textos[9], 20, 325, 580, 200);
    fill(20, 144, 34);
    text(textos[10], 20, 400, 380, 150);
    text(textos[11], 20, 425, 380, 150);
    noStroke();
    BotonesDobles();
    println("P04");
    break;
  case 5:
    image(P5, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[12], 20, 300, 580, 150);
    BotonContinuar();
    println("P05");
    break;
  case 6:
    image(P6, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[13], 20, 300, 580, 150);
    BotonContinuar();
    println("P06");
    break;
  case 7:
    image(P7, 0, 0);
    stroke(0, 255, 0);
    fill(224, 2, 2);
    textSize(36);
    text(textos[14], 20, 20);  // Mostrar el texto correspondiente del archivo
    textAlign(LEFT, CENTER);
    textSize(18);
    fill(0);
    text(textos[15], 20, 275, 580, 150);
    text(textos[16], 20, 315, 580, 200);
    fill(20, 144, 34);
    text(textos[17], 20, 385, 590, 150);
    text(textos[18], 20, 435, 590, 125);
    noStroke();
    BotonesDobles();
    println("P07");
    break;
  case 8:
    image(P8, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[19], 20, 300, 580, 150);
    BotonContinuar();
    println("P08");
    break;
  case 9:
    image(P9, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[20], 20, 300, 580, 150);
    BotonContinuar();
    println("P09");
    break;
  case 10:
    image(P10, 0, 0);
    stroke(0, 255, 0);
    fill(224, 2, 2);
    textSize(36);
    text(textos[21], 20, 20);  // Mostrar el texto correspondiente del archivo
    textAlign(LEFT, CENTER);
    textSize(18);
    fill(0);
    text(textos[22], 20, 275, 580, 150);
    text(textos[23], 20, 315, 580, 200);
    fill(20, 144, 34);
    text(textos[24], 20, 395, 590, 150);
    text(textos[25], 20, 435, 590, 125);
    noStroke();
    BotonesDobles();
    println("P10");
    break;
  case 11:
    image(P11, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[26], 20, 300, 580, 150);
    BotonContinuar();
    println("P011");
    break;
  case 12:
    image(P12, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[27], 20, 300, 580, 150);
    BotonContinuar();
    println("P012");
    break;
  case 13:
    image(P13, 0, 0);
    stroke(0, 255, 0);
    fill(224, 2, 2);
    textSize(36);
    text(textos[28], 20, 20);  // Mostrar el texto correspondiente del archivo
    textAlign(LEFT, CENTER);
    textSize(18);
    fill(0);
    text(textos[29], 20, 275, 580, 150);
    text(textos[30], 20, 315, 580, 200);
    fill(20, 144, 34);
    text(textos[31], 20, 395, 590, 150);
    text(textos[32], 20, 435, 590, 125);
    noStroke();
    BotonesDobles();
    println("P13");
    break;
  case 14:
    image(P14, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[33], 20, 300, 580, 150);
    BotonContinuar();
    println("P14");
    break;
  case 15:
    image(P15, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[34], 20, 300, 580, 150);
    BotonContinuar();
    println("P15");
    break;
  case 16:
    image(P16, 0, 0);
    stroke(0, 255, 0);
    fill(224, 2, 2);
    textSize(36);
    text(textos[35], 20, 20);  // Mostrar el texto correspondiente del archivo
    textAlign(LEFT, CENTER);
    textSize(18);
    fill(0);
    text(textos[36], 20, 275, 580, 150);
    text(textos[37], 20, 335, 500, 200);
    fill(20, 144, 34);
    text(textos[38], 20, 400, 590, 150);
    text(textos[39], 20, 435, 590, 125);
    noStroke();
    BotonesDobles();
    println("P16");
    break;
  case 17:
    image(P17, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[40], 20, 300, 580, 150);
    BotonContinuar();
    println("P17");
    break;
  case 18:
    image(P18, 0, 0, 600, 300);
    textSize(20);
    fill(0);
    text(textos[41], 20, 300, 580, 175);
    BotonContinuar();
    println("P18");
    break;
  case 19:
    background(255);
    image(end, 0, 0);
    BotonContinuar();
    println("P19");
    break;
  case 20:
    image(creditos, 0, 0);
    fill(255);
    textSize(42);
    text("CREDITOS", 290, textoPosY);
    textSize(25);
    text("Alumno:Davis Alejandro Veliz Amagua", 230, textoPosY + 75);
    text("Leajo:93493/6", 105, textoPosY + 125);
    text("Autor: Anónimo", 130, textoPosY + 175);
    text("Presiona R para reiniciar", 300, textoPosY + 300);

    // Animación del texto
    if (textoPosY < 100) {
      textoPosY += 1.5;  // Ajusta la velocidad de desplazamiento cambiando el valor de incremento
    }

    println("P20");
    break;
  default:
    // sino se cumple ninguno de los "casos" (condiciones)
    println("Fuera de la aventura");
    break;
  }

  // Llamar a la función BotonContinuar
}

void mousePressed() {
  if (estado == 0) {
    if (verificarDistancia(mouseX, mouseY, 300, 500, 50)) {
      estado = 1;
    }
  } else if (estado == 1) {
    if (BotonIzquierda && verificarDistancia(mouseX, mouseY, 100, height - 75, 50)) {
      estado = 2;
    }
    if (verificarDistancia(mouseX, mouseY, 450, 525, 50)) {
      estado = 3;
    }
  } else if (estado == 2) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 60)) {
      estado = 4;
    }
  } else if (estado == 3) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 4;
    }
  } else if (estado == 4) {
    if (BotonIzquierda && verificarDistancia(mouseX, mouseY, 100, height - 75, 50)) {
      estado = 5;
    }
    if (verificarDistancia(mouseX, mouseY, 450, 525, 50)) {
      estado = 6;
    }
  } else if (estado == 5) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 7;
    }
  } else if (estado == 6) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 7;
    }
  } else if (estado == 7) {
    if (BotonIzquierda && verificarDistancia(mouseX, mouseY, 100, height - 75, 50)) {
      estado = 8;
    }
    if (verificarDistancia(mouseX, mouseY, 450, 525, 50)) {
      estado = 9;
    }
  } else if (estado == 8) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 19;
    }
  } else if (estado == 9) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 10;
    }
  } else if (estado == 10) {
    if (BotonIzquierda && verificarDistancia(mouseX, mouseY, 100, height - 75, 50)) {
      estado = 11;
    }
    if (verificarDistancia(mouseX, mouseY, 450, 525, 50)) {
      estado = 12;
    }
  } else if (estado == 11) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 13;
    }
  } else if (estado == 12) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 13;
    }
  } else if (estado == 13) {
    if (BotonIzquierda && verificarDistancia(mouseX, mouseY, 100, height - 75, 50)) {
      estado = 14;
    }
    if (verificarDistancia(mouseX, mouseY, 450, 525, 50)) {
      estado = 15;
    }
  } else if (estado == 14) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 16;
    }
  } else if (estado == 15) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 19;
    }
  } else if (estado == 16) {
    if (BotonIzquierda && verificarDistancia(mouseX, mouseY, 100, height - 75, 50)) {
      estado = 17;
    }
    if (verificarDistancia(mouseX, mouseY, 450, 525, 50)) {
      estado = 18;
    }
  } else if (estado == 17) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 50)) {
      estado = 19;
    }
  } else if (estado == 18) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 50)) {
      estado = 19;
    }
  } else if (estado == 19) {
    if (verificarDistancia(mouseX, mouseY, 300, 525, 70)) {
      estado = 20;
    }
  }
}
void BotonesDobles() {
  if (BotonDerecha) {
    if (mouseX >= 400 && mouseX <= 500 && mouseY >= 525 && mouseY <= 575) {
      fill(200, 0, 0);
    } else {
      fill(200);
    }
  }

  if (BotonIzquierda) {
    if (mouseX >= 50 && mouseX <= 150 && mouseY >= 525 && mouseY <= 575) {
      fill(200, 0, 0);
    } else {
      fill(200);
    }
    rect(50, 525, 100, 50);  // Botón A (izquierdo)
    fill(0);
    textSize(25);
    text("A", 95, 545); // Dibujar el texto "A" en el centro del botón
  }

  if (mouseX >= 400 && mouseX <= 500 && mouseY >= 525 && mouseY <= 575) {
    fill(200, 0, 0);
  } else {
    fill(200);
  }
  rect(400, 525, 100, 50);  // Nuevo botón en la derecha para ir al estado P03
  fill(0);
  textSize(25);
  text("B", 440, 545);
}

void BotonContinuar() {
  {
    if (dist(mouseX, mouseY, 300, 525) <= 60) {
      fill(200, 0, 0);
    } else {
      fill(200);
    }
    rect(width/2 - 50, 500, 125, 50);  // Botón Continuar en el centro de la pantalla
    fill(0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Continuar", 310, 525);
  }
}
boolean verificarDistancia(float x1, float y1, float x2, float y2, float Umbral) {
  float distancia = dist(x1, y1, x2, y2);
  if (distancia <= Umbral) {
    return true;
  } else {
    return false;
  }
}
void keyPressed() {
  if (estado == 20 && (key == 'r' || key == 'R')) {
    estado = 0;  // Regresar al caso 0 al presionar la tecla "r" o "R" en el caso 20
  }
}
