//link al video https://youtu.be/JNy_JPIMzZo
let juego;

function setup() {
  createCanvas(1024, 1024);
  let cuadro = loadImage('data/cuadroDiana.png');
  juego = new Juego(cuadro);
}

function draw() {
  background(0);
  juego.ejecutar();
}

function mouseMoved() {
  juego.apuntar();
}

function mousePressed() {
  juego.disparar();
}

function keyPressed() {
  if (keyCode === ENTER) {
    juego.iniciar();
  }
}
