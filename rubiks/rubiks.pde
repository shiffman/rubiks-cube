import peasy.*;
PeasyCam cam;

final int dim = 3;

Box[][][] cube = new Box[dim][dim][dim];
float len = 25;

void setup() {
  size(600, 600, P3D);
  color[] colors = {#FF0000, #FFA500, #00FF00, #0000FF, #FFFFFF, #FFFF00};
  cam = new PeasyCam(this, 400);
  float offset = 2 * len * (dim/2);
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        // front, back, right, left, top, bottom
        cube[i][j][k] = new Box(2*i*len-offset, 2*j*len-offset, 2*k*len-offset, len, colors);
      }
    }
  }
}

void keyPressed() {
  if (key == '1') {
    rotateZ(true, 0);
  } else if (key == '2') {
    rotateZ(false, 0);
  }
}

void draw() {
  background(0); 
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        cube[i][j][k].show();
      }
    }
  }
}
