class Box {
  PVector pos;
  float len;
  
  // front, back, right, left, top, bottom
  color[] colors;

  Box(float x, float y, float z, float side, color[] cols) {
    pos = new PVector(x, y, z);
    len = side/2;
    colors = cols;
  }

  void show() {
    push();
    stroke(0);
    translate(pos.x, pos.y, pos.z);
    beginShape(QUADS);
    // Front
    fill(colors[0]);
    vertex(-len, -len, len);
    vertex(len, -len, len);
    vertex(len, len, len);
    vertex(-len, len, len);
    // Back
    fill(colors[1]);
    vertex(-len, -len, -len);
    vertex(len, -len, -len);
    vertex(len, len, -len);
    vertex(-len, len, -len);

    // Right
    fill(colors[2]);
    vertex(len, -len, -len);
    vertex(len, len, -len);
    vertex(len, len, len);
    vertex(len, -len, len);

    // Left
    fill(colors[3]);
    vertex(-len, -len, -len);
    vertex(-len, len, -len);
    vertex(-len, len, len);
    vertex(-len, -len, len);
    // Top
    fill(colors[4]);
    vertex(-len, -len, -len);
    vertex(len, -len, -len);
    vertex(len, -len, len);
    vertex(-len, -len, len);
    // Bottom
    fill(colors[5]);
    vertex(-len, len, -len);
    vertex(len, len, -len);
    vertex(len, len, len);
    vertex(-len, len, len);
    endShape();
    pop();
  }
}
