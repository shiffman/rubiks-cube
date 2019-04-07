class Face {
  int id = 0;
  color col;
  PVector normal;

  Face(int id, color c, PVector n) {
    this.id = id;
    col = c;
    normal = n.copy();
    //normal.mult(0.5);
  }

  void turnX(float angle) {
    normal = rotateVX(normal, angle);
    roundV(normal);
  }

  void turnY(float angle) {
    normal = rotateVY(normal, angle);
    roundV(normal);
  }

  void turnZ(float angle) {
    normal = rotateVZ(normal, angle);
    roundV(normal);
  }

  void show() {
    pushMatrix();
    fill(col);
    translate(normal.x*0.5, normal.y*0.5, normal.z*0.5);
    beginShape(QUAD);
    if (abs(normal.x) > 0) {
      vertex(0, -0.5, -0.5);
      vertex(0, 0.5, -0.5);
      vertex(0, 0.5, 0.5);
      vertex(0, -0.5, 0.5);
    } else if (abs(normal.y) > 0) {
      vertex(-0.5, 0, -0.5);
      vertex(0.5, 0, -0.5);
      vertex(0.5, 0, 0.5);
      vertex(-0.5, 0, 0.5);
    } else if (abs(normal.z) > 0) {
      vertex(-0.5, -0.5);
      vertex(0.5, -0.5, 0);
      vertex(0.5, 0.5, 0);
      vertex(-0.5, 0.5, 0);
    }
    endShape(CLOSE);
    popMatrix();
  }
}


void roundV(PVector v) {
  v.x = round(v.x); 
  v.y = round(v.y); 
  v.z = round(v.z);
}

PVector rotateVZ(PVector v1, float angle) {
  PVector v2 = new PVector();
  v2.x = v1.x * cos(angle) - v1.y * sin(angle);
  v2.y = v1.x * sin(angle) + v1.y * cos(angle);
  v2.z = v1.z;
  return v2;
}

PVector rotateVY(PVector v1, float angle) {
  PVector v2 = new PVector();
  v2.x = v1.x * cos(angle) + v1.z * sin(angle);
  v2.y = v1.y;
  v2.z = -v1.x * sin(angle) + v1.z * cos(angle);
  return v2;
}

PVector rotateVX(PVector v1, float angle) {
  PVector v2 = new PVector();
  v2.x = v1.x;
  v2.y = v1.y * cos(angle) - v1.z * sin(angle);
  v2.z = v1.y * sin(angle) + v1.z * cos(angle);
  return v2;
}
