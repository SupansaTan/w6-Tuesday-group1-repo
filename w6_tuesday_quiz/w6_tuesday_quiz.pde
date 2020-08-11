color blue = color(14,77,146);
color pink = color(91,194,54);
color orange = color(245,173,148);
color white = color(255);

color[] colors = {blue,pink,orange};

class Ball {

  float position_x, position_y;
  int size, get_color;
  int xspeed = 1;
  int yspeed = 1;
  
  Ball(float tempx, float tempy, int tempSize, int rand_color) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    get_color = rand_color;
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
 
    fill(colors[get_color]);
    stroke(colors[get_color]);
    ellipse(position_x,position_y,size,size);
  }
}

Ball[] balls = new Ball[2];

void setup() {
  size(400,400);
  for (int i = 0; i < 10; i++) {
    int rand_color = int(random(colors.length));
    balls[i] = new Ball(30*i,30*i,20*i,rand_color);
  }
}

void draw() {

  background(white);
 
  for (int i = 0; i < 10; i++) {
    balls[i].draw();
    balls[i].bounce();
  }
}
