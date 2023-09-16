//Link al video https://youtu.be/YfgF8Mg-shs
let autoX;
let autoY;
let anchoAuto = 50;
let velAuto = 6;

let obstaculo = [];
let AnchoObstaculo = 100;
let velObstaculo = 7;

let carrilesIzquierdos = [];
let carrilesDerechos = [];
let Anchocarril = 15;
let AltoCarril = 30;
let espaciadoCarril = 135; // Espacio vertical entre carriles
let velCarril = 7;

let EmpezarTiempo;
let elapsedTime = 0;
let winTime = 60; // 1 minuto en segundos

let carImg;
let obsImg;

// Propiedades de colisión del coche
let AutoColX;
let AutoColY;
let AnchoColAuto = 30; // Ancho de colisión
let AltoColAuto = 60; // Alto de colisión

// Propiedades de colisión de los obstáculos
let AnchoColObstaculo = 60; // Ancho de colisión
let AltoColObstaculo = 85; // Alto de colisión

let Estado = "menu"; // Estado inicial del juego

function setup() {
  createCanvas(800, 800);
  autoX = width / 2;
  autoY = height - 50;
  EmpezarTiempo = millis();
  carImg = loadImage('data/Sprite_carro.png');
  obsImg = loadImage('data/Sprite_Obstaculo.png');
  Caratula = loadImage('data/Caratula.png');
  crearCarriles();
}

function draw() {
  background(220);

  // Gestión de estados del juego con switch-case
  switch (Estado) {
  case "menu":
    // Pantalla de menú
    Menu();
    break;
  case "juego":
    // Juego principal
    Juego();
    break;
  case "credits":
    // Pantalla de créditos
    Creditos();
    break;
  case "gameover":
    // Pantalla de juego terminado
    dibujaGameover();
    break;
  case "Ganaste":
    Ganar() ;
    break;
  }
}
