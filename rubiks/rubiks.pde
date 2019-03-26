import peasy.*;
PeasyCam cam;

final int dim = 3;

Box[][][] cube = new Box[dim][dim][dim];
float len = 50;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  float offset = len * (dim/2);
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        // front, back, right, left, top, bottom
        color[] colors = {#FF0000, #FFA500, #00FF00, #0000FF, #FFFFFF, #FFFF00};
        cube[i][j][k] = new Box(i*len-offset, j*len-offset, k*len-offset, len, colors);
      }
    }
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
