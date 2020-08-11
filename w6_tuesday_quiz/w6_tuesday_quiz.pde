color blue = color(14,77,146);
color pink = color(91,194,54);
color orange = color(245,173,148);
color white = color(255);

color[] colors = {blue,pink,orange};

class Ball {
  float position_x, position_y;
  int size, get_color;
  
  Ball(float tempx, float tempy, int tempSize, int rand_color) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    get_color = rand_color;
  }
  
  void draw() {
    fill(colors[get_color]);
    stroke(colors[get_color]);
    ellipse(position_x,position_y,size,size);
  }
}

Ball[] balls = new Ball[10];

void setup() {
  size(400,400);
  background(white);
  for (int i = 0; i < 10; i++) {
    int rand_color = int(random(colors.length));
    balls[i] = new Ball(30*i,30*i,20*i,rand_color);
  }
}

void draw() {
  background(white);
 
  for (int i = 0; i < 10; i++) {
    balls[i].draw();
  }
}
