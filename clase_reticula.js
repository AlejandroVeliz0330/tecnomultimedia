class Reticula {
  constructor() {
    this.x = mouseX;
    this.y = mouseY;
    this.size = 20;
    this.apuntando = false;
  }

  apuntar() {
    this.x = mouseX;
    this.y = mouseY;
    this.apuntando = true;
  }

  mostrar() {
    noFill();
    stroke(255, 0, 0);
    ellipse(this.x, this.y, this.size);
    line(this.x - this.size, this.y, this.x + this.size, this.y);
    line(this.x, this.y - this.size, this.x, this.y + this.size);
  }
}
