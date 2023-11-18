class Juego {
  constructor(cuadro) {
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
    this.tiempoInicio = 0;
    this.fondo = loadImage('data/P1.png');
    this.cuadro = cuadro;
    this.cuadroX = 0;
    this.estado = "menu";
  }

  iniciar() {
    this.tiempoInicio = millis();
    this.tiempoRestante = this.tiempoMaximo * 1000;
    this.dianas = [];

    let radio = this.dianaRadioBase;
    for (let i = 0; i < this.numDianas; i++) {
      let puntosCirculo = i + 1;
      this.dianas.push(new Diana(this.dianaX, this.dianaY, radio, puntosCirculo, this.coloresDianas[i]));
      radio -= this.dianaRadioBase / this.numDianas;
    }

    this.estado = "juego";
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
    let tiempoTranscurrido = millis() - this.tiempoInicio;
    this.tiempoRestante = max(this.tiempoMaximo * 1000 - tiempoTranscurrido, 0);

    if (this.tiempoRestante <= 0) {
      this.estado = "perder";
    }

    if (this.puntos >= 1000) {
      this.estado = "ganar";
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
    let dianaY = height - this.cuadro.height / 2;
    for (let i = 0; i < this.dianas.length; i++) {
      this.dianas[i].x = this.cuadroX + this.cuadro.width / 2;
      this.dianas[i].y = dianaY;
      this.dianas[i].mostrar();
    }

    this.reticula.mostrar();
  }

  ejecutar() {
    switch (this.estado) {
      case "menu":
        this.mostrarMenu();
        break;
      case "juego":
        this.juego();
        break;
      case "ganar":
        this.mostrarGanar();
        break;
      case "perder":
        this.mostrarPerder();
        break;
    }
  }

  juego() {
    if (this.tiempoRestante <= 0) {
      this.estado = "perder";
    }
    image(this.fondo, 0, 0, width, height);
    this.cuadroX += this.dianaSpeed;
    if (this.cuadroX > width) {
      this.cuadroX = -this.cuadro.width;
    }
    image(this.cuadro, this.cuadroX, height - this.cuadro.height, this.cuadro.width + 25, this.cuadro.height - 50);
    this.actualizar();
    this.mostrar();
    if (this.ganador) {
      this.estado = "ganar";
    }
  }

  mostrarMenu() {
    // Dibuja el menú
    textSize(48);
    fill(255);
    text('Presiona Enter para comenzar', width / 2 - 350, height / 2);
    textSize(36);
    text('Mi minijuego es un shooter donde hay una retícula que \nsigue el movimiento del mouse y con la que deberás \napuntar a una diana en movimiento y disparar con \nel click izquierdo para obtener puntos. Ganas si\nconsigues 1000 puntos antes de que termine el \ntiempo o de lo contrario pierdes', 100, 150);
  }

  mostrarGanar() {
    // Dibuja la pantalla de "ganar"
    textSize(48);
    fill(0, 255, 0);
    text('¡Has ganado!', width / 2 - 120, height / 2);
  }

  mostrarPerder() {
    // Dibuja la pantalla de "perder"
    textSize(48);
    fill(255, 0, 0);
    text('¡Has perdido!', width / 2 - 120, height / 2);
  }
}
