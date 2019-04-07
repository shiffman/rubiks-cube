class Cubie {
  int x;
  int y;
  int z;
  PMatrix3D pos;
  int id;
  Face[] faces = new Face[6];

  Cubie(int x, int y, int z, PMatrix3D matrix, int id) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.pos = matrix;
    this.id = id;
    faces[0] = new Face(0, color(255), new PVector(0, 1, 0));
    faces[1] = new Face(1, color(255, 255, 0), new PVector(0, -1, 0));
    faces[2] = new Face(2, color(255, 150, 0), new PVector(1, 0, 0));
    faces[3] = new Face(3, color(255, 0, 0), new PVector(-1, 0, 0));
    faces[4] = new Face(5, color(0, 255, 0), new PVector(0, 0, 1));
    faces[5] = new Face(4, color(0, 0, 255), new PVector(0, 0, -1));
  }

  void update(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
    pos.reset();
    pos.translate(this.x, this.y, this.z);
  }
  
  void rotateX(float angle) {
    for (Face f : faces) {
      f.turnX(angle);
    }
  }

  void rotateZ(float angle) {
    for (Face f : faces) {
      f.turnZ(angle);
    }
  }

  void rotateY(float angle) {
    for (Face f : faces) {
      f.turnY(angle);
    }
  }



  void show() {
    stroke(0);
    strokeWeight(0.1);
    pushMatrix(); 
    applyMatrix(pos);
    float r = 0.5;
    noFill();
    box(1);
    rectMode(CENTER);
    for (int i = 0; i < faces.length; i++) {
      faces[i].show(); 
    }

    popMatrix();
  }
}
