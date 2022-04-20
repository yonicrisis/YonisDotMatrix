// iniciando, librerías y declaraciones
import processing.svg.*;
PImage inputImage;

// definir tamaño de trama y variables para filas y columnas
int cellSize = 20;
int dotSize = cellSize-4;
int minDotSize = 2; // tamaño mínimo para cortar
int cols, rows;

void setup(){
  size(1200, 600);
  //size(1200, 600, SVG, "paneles60.svg"); //para salvar en svg
  
  // importar imagen y redimensionar 
  //inputImage = loadImage("input_city_1800_600.jpg");
  inputImage = loadImage("input_image_0.jpg");
  cols = inputImage.width/cellSize;
  rows = inputImage.height/cellSize;
  inputImage.resize(cols, rows);
  inputImage.loadPixels();
}

void draw(){ 
  background(0);
  // para confirmar
  // image(inputImage, 0, 0); // imprime imagen en el fondo
  println("columns: "+cols+" rows: "+rows); // escupe numero de líneas
  
  // loop cuenta filas
  for (int k = 0; k < rows; k++) {
    //println("dot in row: "+k); //confirmar cuenta de fila
    
    // loop cuenta columnas
    for (int j = 0; j < cols; j++) {
      int pixloc = (k*cols+j); // cuenta el pixel en que estamos
      println("dot in row: "+k+" column: "+j+" pixel: "+pixloc); //confirmar cuenta de columna

      // evalua luminosidad de pixel
      color pixcol = inputImage.pixels[pixloc];
      float dotSizePaint = (brightness(pixcol)/255)*dotSize;
      // pinta elipse si más grande que minDotSize
      if (dotSizePaint >= minDotSize){
        fill(255);
        noStroke();
        ellipse(j*cellSize+cellSize/2, k*cellSize+cellSize/2, dotSizePaint, dotSizePaint);
      }
    }
  }
  
  // terminó el programa
  //exit();
  noLoop();
}
