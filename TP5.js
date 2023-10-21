//link al video:https://youtu.be/byAvxbfi36Q
let juego;
let fondo;
let cuadro;
let cuadroX = 0; // Inicializa la posición en x del cuadro
let estado = "menu"; // Estado inicial del juego: "menu", "juego", "ganar" o "perder"

function preload() {
  fondo = loadImage('data/P1.png');
  cuadro = loadImage('data/cuadroDiana.png');
}

function setup() {
  createCanvas(1024, 1024);
  juego = new Juego();
}

function draw() {
  background(0);
  switch (estado) {
    case "menu":
      mostrarMenu();
      break;
    case "juego":
      if (juego.tiempoRestante <= 0) {
        estado = "perder";
      }
      image(fondo, 0, 0, width, height);
      cuadroX += juego.dianaSpeed;
      if (cuadroX > width) {
        cuadroX = -cuadro.width;
      }
      image(cuadro, cuadroX, height - cuadro.height, cuadro.width + 25, cuadro.height - 50);
      juego.actualizar();
      juego.mostrar();
      if (juego.ganador) {
        estado = "ganar";
      }
      break;
    case "ganar":
      mostrarGanar();
      break;
    case "perder":
      mostrarPerder();
      break;
  }
}

function mouseMoved() {
  if (estado === "juego") {
    juego.apuntar();
  }
}

function mousePressed() {
  if (estado === "juego") {
    juego.disparar();
  }
}

function keyPressed() {
  if (keyCode === ENTER) {
    switch (estado) {
      case "menu":
        juego.iniciar();
        estado = "juego";
        break;
    }
  }
}

function mostrarMenu() {
  // Dibuja el menú
  textSize(48);
  fill(255);
  text('Presiona Enter para comenzar', width / 2 - 350, height / 2);
  textSize(36);
  text('Mi minijuego es un shooter donde hay una retícula que \nsigue el movimiento del mouse y con la que deberás \napuntar a una diana en movimiento y disparar con \nel click izquierdo para obtener puntos. Ganas si\nconsigues 1000 puntos antes de que termine el \ntiempo o de lo contrario pierdes', 100, 150);
}

function mostrarGanar() {
  // Dibuja la pantalla de "ganar"
  textSize(48);
  fill(0, 255, 0);
  text('¡Has ganado!', width / 2 - 120, height / 2);
}

function mostrarPerder() {
  // Dibuja la pantalla de "perder"
  textSize(48);
  fill(255, 0, 0);
  text('¡Has perdido!', width / 2 - 120, height / 2);
}
