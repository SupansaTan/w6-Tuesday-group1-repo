color blue = color(14,77,146);
color pink = color(91,194,54);
color orange = color(245,173,148);
color white = color(255);

color[] colors = {blue,pink,orange};

class Ball {
  float position_x, position_y,sum;
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
  
  float getarea(){
    int index = 0;
    if (index < balls.length){
      float area = PI * pow(size/2,2);
      sum += area;
      index += 1;
    }
    return sum;
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
 
  for (int i = 0; i < balls.length+1 ; i++) {
    if (i < balls.length){
      balls[i].draw();
      balls[i].getarea();
    }
    else {
    }
  }
  print("Sum of area of all Ball : " + balls[balls.length -1].sum);
  noLoop();
}
