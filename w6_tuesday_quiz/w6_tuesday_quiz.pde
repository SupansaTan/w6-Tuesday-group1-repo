color blue = color(14,77,146);
color pink = color(91,194,54);
color orange = color(245,173,148);
color white = color(255);

color[] colors = {blue,pink,orange};

float[] area_ball;

class Ball {

  float position_x, position_y,sum;
  int size, get_color;
  int xspeed = 1;
  int yspeed = 1;
  int index = 0;
  float area;
  
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
  
  float getArea(){
    sum = 0;
    if (index < balls.length){
      area = PI * pow((balls[index].size)/2,2);
      area_ball[index] = area;
      sum += area;
      index += 1;
    }
    return sum;
  }
}

Ball[] balls = new Ball[10];

void setup() {
  size(400,400);
  for (int i = 0; i < balls.length; i++) {
    int rand_color = int(random(colors.length));
    balls[i] = new Ball(30*i,30*i,20*i,rand_color);
  }
  area_ball = new float[balls.length];
}

void draw() {
  delay(50);
  background(white);
  for (int i = 0; i < balls.length+1 ; i++) {
    if (i < balls.length){
      balls[i].draw();
      balls[i].bounce();
      balls[i].getArea();
    }
    else {
      //println("Sum of area of all Ball : " + balls[balls.length -1].sum);
    }
  }
}

void mouseClicked(){
    for (int i=0; i<balls.length; i++){
      if ( balls[i].position_x <= mouseX && mouseX <= (balls[i].position_x + balls[i].size) && balls[i].position_y <= mouseY && mouseY <= (balls[i].position_y + balls[i].size)){
        println(area_ball[i]);
      }
    }
}
