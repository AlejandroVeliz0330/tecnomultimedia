class Juego {
  constructor() {
    this.dianas = [];
    this.puntos = 0;
    this.dianaX = width / 2;
    this.dianaY = height / 2;
    this.dianaRadioBase = 100;
    this.numDianas = 4;
    this.dianaSpeed = 5;
    this.tiempoMaximo = 30;
    this.tiempoRestante = 0;
    this.reticula = new Reticula();
    this.coloresDianas = [255, color(0, 191, 255), color(255, 0, 0), color(255, 255, 0)];
    this.tiempoInicio = 0; // esta variable para rastrea el inicio del tiempo
  }

  iniciar() {
    this.tiempoInicio = millis(); // Inicializar el tiempo de inicio
    this.tiempoRestante = this.tiempoMaximo * 1000;
    let radio = this.dianaRadioBase;
    for (let i = 0; i < this.numDianas; i++) {
      let puntosCirculo = i + 1;
      this.dianas.push(new Diana(this.dianaX, this.dianaY, radio, puntosCirculo, this.coloresDianas[i]));
      radio -= this.dianaRadioBase / this.numDianas;
    }
  }

  apuntar() {
    this.reticula.apuntar();
  }

  disparar() {
    for (let i = this.dianas.length - 1; i >= 0; i--) {
      if (this.dianas[i].hit(this.reticula.x, this.reticula.y) && this.dianas[i].visible) {
        this.puntos += this.dianas[i].puntos;
      }
    }
  }

  actualizar() {
    let tiempoTranscurrido = millis() - this.tiempoInicio; // Calcular el tiempo transcurrido
    this.tiempoRestante = max(this.tiempoMaximo * 1000 - tiempoTranscurrido, 0);

    if (this.tiempoRestante <= 0) {
      estado = "perder"; // Cambia al estado "perder" al agotarse el tiempo
    }

    if (this.puntos >= 1000) {
      estado = "ganar"; // Cambia el estado a "ganar" al alcanzar 1000 puntos
    }

    for (let i = 0; i < this.dianas.length; i++) {
      this.dianas[i].mover();
      this.dianas[i].rebotar();
    }
  }

 mostrar() {
    textSize(24);
    fill(0, 255, 0);
    text('Puntuación: ' + this.puntos, 20, 30);
    let segundosRestantes = ceil(this.tiempoRestante / 1000);
    fill(0, 255, 0);
    text('Tiempo restante: ' + segundosRestantes + 's', width - 250, 30);

    // Ajusta la posición de las dianas en función de cuadroX
    let dianaY = height - cuadro.height / 2;
    for (let i = 0; i < this.dianas.length; i++) {
      this.dianas[i].x = cuadroX + cuadro.width / 2;
      this.dianas[i].y = dianaY;
      this.dianas[i].mostrar();
    }

    this.reticula.mostrar();
  }
}
