import peasy.*;

PeasyCam cam;


float angle = 0;

color[] colors = {
  #FFFFFF, #FFFF00, 
  #FFA500, #FF0000, 
  #00FF00, #0000FF, 
  #000000
};

Cubie[] cubies = new Cubie[3*3*3];

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);

  // create the cubies
  int i = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D m = new PMatrix3D();
        m.translate(x, y, z);
        cubies[i] = new Cubie(x, y, z, m, i);
        i++;
      }
    }
  }
}

void keyPressed() {
  if (key == '1') {
    turnX(1, -1);
  } else if (key == '2') {
    turnX(-1, -1);
  } else if (key == '3') {
    turnY(1, -1);
  } else if (key == '4') {
    turnY(-1, -1);
  } else if (key == '5') {
    turnZ(1, -1);
  } else if (key == '6') {
    turnZ(-1, -1);
  }
}

void turnX(int dir, int index) {
  for (int i = 0; i < cubies.length; i++) {
    Cubie qb = cubies[i];
    if (qb.x == index) {
      PMatrix2D m2 = new PMatrix2D();
      m2.rotate(dir*HALF_PI);
      m2.translate(qb.y, qb.z);
      qb.update(qb.x, int(round(m2.m02)), int(round(m2.m12)));
      qb.rotateX(dir*HALF_PI);
    }
  }
}

void turnY(int dir, int index) {
  for (int i = 0; i < cubies.length; i++) {
    Cubie qb = cubies[i];
    if (qb.y == index) {
      PMatrix2D m2 = new PMatrix2D();
      m2.rotate(dir*HALF_PI);
      m2.translate(qb.x, qb.z);
      qb.update(int(round(m2.m02)), qb.y, int(round(m2.m12)));
      qb.rotateY(-dir*HALF_PI);
    }
  }
}

void turnZ(int dir, int index) {
  for (int i = 0; i < cubies.length; i++) {
    Cubie qb = cubies[i];
    if (qb.z == index) {
      PMatrix2D m2 = new PMatrix2D();
      m2.rotate(dir*HALF_PI);
      m2.translate(qb.x, qb.y);
      qb.update(int(round(m2.m02)), int(round(m2.m12)), qb.z);
      qb.rotateZ(dir*HALF_PI);
    }
  }
}


void draw() {
  background(100);
  scale(50);
  for (Cubie qb : cubies) {
    qb.show();
  }
}
