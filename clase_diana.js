class Diana {
  constructor(x, y, radio, puntos, colorDiana) {
    this.x = x;
    this.y = y;
    this.radio = radio;
    this.puntos = puntos;
    this.visible = true;
    this.color = colorDiana;
  }

  mostrar() {
    if (this.visible) {
      fill(this.color);
      stroke(255, 0, 0);
      ellipse(this.x, this.y, this.radio * 2);
    }
  }

  hit(x, y) {
    let d = dist(x, y, this.x, this.y);
    return d < this.radio;
  }

  mover() {
    this.x += juego.dianaSpeed;
  }

  rebotar() {
    if (this.x + this.radio > width  || this.x - this.radio < 0) {
      juego.dianaSpeed *= -1;
    }
  }
}
