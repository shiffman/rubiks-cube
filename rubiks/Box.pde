final int FRT = 0;
final int BCK = 1;
final int LFT = 2;
final int RGT = 3;
final int TPP = 4;
final int BOT = 5;

class Box {
  PVector pos;
  float len;

  // front, back, right, left, top, bottom
  color[] colors;

  void rotateZ(boolean clockwise) {
    if (clockwise) {
      color temp = colors[RGT];
      colors[RGT] = colors[TPP];
      colors[TPP] = colors[LFT];
      colors[LFT] = colors[BOT];
      colors[BOT] = temp;
    } else {
      color temp = colors[RGT];
      colors[RGT] = colors[BOT];
      colors[BOT] = colors[LFT];
      colors[LFT] = colors[TPP];
      colors[TPP] = temp;
    }
  }

  void forward() {
    color temp = colors[BCK];
    colors[BCK] = colors[TPP];
    colors[TPP] = colors[FRT];
    colors[FRT] = colors[BOT];
    colors[BOT] = temp;
  }

  Box copy() {
    color[] dest = new color[6];
    arrayCopy(colors, dest);
    return new Box(pos.x, pos.y, pos.z, len, dest);
  }

  Box(float x, float y, float z, float len, color[] cols) {
    pos = new PVector(x, y, z);
    this.len = len;
    colors = cols;
  }

  void show() {
    push();
    stroke(0);
    strokeWeight(4);
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
