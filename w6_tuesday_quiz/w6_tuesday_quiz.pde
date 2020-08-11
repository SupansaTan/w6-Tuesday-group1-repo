class Ball {
  float position_x;
  float position_y;
  int size;
  
  Ball(float tempx, float tempy, int tempSize) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
  }
  
  void draw() {
    ellipse(position_x,position_y,size,size);
  }
}

Ball[] balls = new Ball[10];

void setup() {
  size(400,400);
  for (int i = 0; i < 10; i++) {
    balls[i] = new Ball(30*i,30*i,20*i);
  }
}

void draw() {
  for (int i = 0; i < 10; i++) {
    balls[i].draw();
  }
}
