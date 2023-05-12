//int estados;
String estado;
int c; //contador
PImage p;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
String text1 = "La Raza British Shorthair son originarios \n Reino Unido, donde se cree que fueron criados \n por primera vez por los antiguos romanos";
String text2 = "Características físicas: Los British Shorthair \n son gatos de tamaño mediano con cuerpos \n musculosos y redondos Tienen una cabeza ancha \n y redonda ojos grandes y redondos";
String text3 = "Personalidad: Los British Shorthair son conocidos \n por ser gatos tranquilos y relajados, pero \n también son juguetones y curiosos. \n Son muy cariñosos y les gusta pasar tiempo con sus dueños, \n pero también son independientes y pueden pasar tiempo solos.";
String text4 = "Historia en la cultura popular: Los gatos British Shorthair \n  han aparecido en varias obras de arte y literatura.\n Uno de los gatos más famosos de la literatura es el Gato de Cheshire \n en Alicia en el país de las maravillas de Lewis Carroll";

void setup() {
  
  size( 640, 480 );
  textAlign( CENTER, CENTER );
  textSize( 50 );
  fill(200);
  
  p = loadImage("Caratula.png");
  p2 = loadImage("diapositiva2.png");
  p3 = loadImage("diapositiva3.png");
  p4 = loadImage("diapositiva4.png");
  p5 = loadImage("diapositiva5.png");
  p6 = loadImage("diapositiva6.png");
  
  
  estado = "menu";
  
  frameRate( 60 );
}

void draw() {
  //
  //MAQUINA DE ESTADOS --
  //

  println(frameCount);
   
  if ( estado.equals("menu") ) {
    image(p, 0, 0);
    fill(255);
    text( "Empezar", 190, 350 );
    text( "razas de gatos:", 190, 150 );
    text( " British Shorthair", 450, 200);
    fill(237, 29, 29);
    circle( width/2, height/4*3, 50 );
     
   
    //
  } else if (estado.equals("p1") ) {
    image(p2, 0, 0);
    fill(0);
    textSize( 25 );
    text( text1 , frameCount  ,140); 
 
    if (frameCount > 320)
  frameCount = 320;
     
    //
    c++;  //suma 1 per frame;
    if( c >= 600 ){  // 60fps * 10seg = 600
      estado = "p2";
      c = 0;  //RESET DE VARIABLE CONTADOR
      
    }
    //
  } else if (estado.equals("p2") ) {
    image(p3, 0, 0); 
    textSize(22);
    frameRate(60);
    text( text2, 235, frameCount -300 );
   if (frameCount > 500 )
   frameCount = 500;
   
    //
    c++;  //suma 1 per frame
    if( c >= 300 ){  // 60fps * 5seg = 300
      estado = "p3";
      c = 0;  //RESET DE VARIABLE CONTADOR
    }
    //
  } else if (estado.equals("p3") ) {
    image(p4, 0, 0);
    text( text3, frameCount - 500, 165 );
    if (frameCount > 810)
    frameCount = 810;
    
    c++;  
    if( c >= 820 ){  // 60fps * 5seg = 300
      estado = "p4";
      c = 0;  //RESET DE VARIABLE CONTADOR
    }
    //
  } else if (estado.equals("p4") ) {
    image(p5, 0, 0);
    fill(255);
    text( text4, 320, frameCount - 800 );
    if(frameCount > 1040)
    frameCount = 1040;
    //
  c++;  //suma 1 per frame
    if( c >= 1040 ){  // 60fps * 5seg = 300
      estado = "p5";
      c = 0;  //RESET DE VARIABLE CONTADOR
    }   
    //
  } else if (estado.equals("p5") ) {  
    image(p6, 0, 0);
    textSize(25);
    text("gracias por tu atencion", 320, 80);
    text("reiniciar", 320, 140);
    fill(237, 29, 29);
    rect( 270, 190, 100, 60);
       
   
  }
  println( estado );
}

void mousePressed() {
  // circle( width/2, height/4*3, 50 );  <-- de acá salen los datos
  if( estado.equals("menu") ){
    if( dist(width/2, height/4*3, mouseX, mouseY) < 50/2 ){
      estado = "p1";
    }
  }
  if( estado.equals("p5") ){
    if (mousePressed == true) {
    if (mouseX > 270 && mouseX < 370 && mouseY > 190 && mouseY < 250) {    
      estado = "menu";
      frameCount = 0;
      }
    }
  }
}
