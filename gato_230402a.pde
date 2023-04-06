PImage gato;

void setup(){

  size (800, 800);


gato = loadImage("gato.jpg");


}
void draw(){
  image(gato, 0, 0);


  background (11, 160, 64);
  fill(255);
noStroke();
circle(400, 200, 250);
fill(255);


triangle(260, 150, 380, 125, 312, 25);
triangle(400, 115, 510, 140, 440, 25);
fill(224, 138, 138);
triangle(285, 170, 380, 125, 312, 25);
triangle(415, 115, 510, 140, 440, 25);
fill(213,234,80);
circle(390, 175, 40);
fill(144,191,203);
circle(490, 175, 40);


fill(224, 138, 138);
noStroke();
rect(440, 220, 33, 10, 35);
rect(450, 220, 14, 28, 50);

noFill();
stroke(0);
arc(432, 265, 50, 50, 0, PI / 2.0);
arc(480, 262, 50, 50, 1, PI / 1.25);

fill(0);
fill(255);
noStroke();
rect(0, 130, 350, 265, 28);
circle(400, 200, 250);

triangle(260, 150, 380, 125, 312, 25);
triangle(400, 115, 510, 140, 440, 25);
fill(224, 138, 138);
triangle(285, 170, 380, 125, 312, 25);
triangle(415, 115, 510, 140, 440, 25);
fill(213,234,80);
circle(390, 175, 40);
fill(144,191,203);
circle(490, 175, 40);


fill(250);
circle(448,262, 130);

fill(224, 138, 138);
noStroke();
rect(440, 230, 33, 10, 35);
rect(450, 235, 14, 28, 50);

noFill();
stroke(0);
arc(432, 265, 50, 50, 0, PI / 2.0);
arc(480, 262, 50, 50, 1, PI / 1.25);

noStroke();
fill(11, 160, 64);

triangle(0, 200, 0, 0, 250, 100);

fill(0);
ellipse(390, 175, 10, 25);
ellipse(490, 175, 10, 25);

rect(456, 260, 1, 16, 50);


}
