import peasy.*;
PeasyCam cam;

final int dim = 3;

Box[][][] cube = new Box[dim][dim][dim];
float len = 25;


boolean animating = false;
boolean clockwise = false;
float angle = 0;
int index = -1;


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

  if (!animating) {
    animating = true;
    angle = 0;
    if (key == '1') {
      clockwise = true;
      index = 0;
    } else if (key == '2') {
      clockwise = false;
      index = 0;
    } else if (key == '3') {
      clockwise = true;
      index = 1;
    } else if (key == '4') {
      clockwise = false;
      index = 1;
    } else if (key == '5') {
      clockwise = true;
      index = 2;
    } else if (key == '6') {
      clockwise = false;
      index = 2;
    }
  }
}

void draw() {
  background(51); 

  if (animating) {
    angle = angle += 0.05;
    if (angle >= HALF_PI) {
      angle = HALF_PI;
      animating = false;
      rotateCubeZ(clockwise, index);
    }
  }
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        push();
        if (animating && k == index) {
          if (clockwise) rotate(-angle);
          else rotate(angle);
        }
        cube[i][j][k].show();
        pop();
      }
    }
  }
}
