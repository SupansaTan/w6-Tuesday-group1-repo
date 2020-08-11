class Ball {
  float position_x = 0;
  float position_y = 0;
  int size;
  int xspeed = 1;
  int yspeed = 1;
  
  Ball(float tempx, float tempy, int tempSize) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
  }
  
  void bounce() {
    position_x = position_x + xspeed;
    position_y = position_y + yspeed;
    if (position_x > width || position_x < 0) {
      xspeed = xspeed * -1;
    }
    if (position_y > height || position_y < 0) {
      yspeed = yspeed * -1;
    }
  }
  
  void draw() {
    background(255);
    ellipse(position_x,position_y,size,size);
  }
}

Ball[] balls = new Ball[2];

void setup() {
  size(400,400);
  for (int i = 0; i < 2; i++) {
    balls[i] = new Ball(width,200,80);
  }
}

void draw() {
  for (int i = 0; i < 2; i++) {
    balls[i].draw();
    balls[i].bounce();
  }
}
