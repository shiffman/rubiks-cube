int[] xs = {0, 1, 2, 2, 2, 1, 0, 0};
int[] ys = {0, 0, 0, 1, 2, 2, 2, 1};

Box getBox(int i, int j, int k) {
  return cube[i][j][k].copy();
}

void setBox(Box b, int i, int j, int k) {
  cube[i][j][k] = b;
}

void rotateZ(boolean clockwise, int index) {
  Box[] boxes = new Box[8]; 
  for (int i = 0; i < boxes.length; i++) {
    boxes[i] = getBox(xs[i], ys[i], index);
    boxes[i].rotateZ(clockwise);
  }
  for (int i = 0; i < boxes.length; i++) {
    setBox(boxes[(i+2)%boxes.length], xs[i], ys[i], index);
  }
}
