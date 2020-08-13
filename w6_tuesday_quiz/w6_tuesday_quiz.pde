color blue = color(14, 77, 146);
color pink = color(91, 194, 54);
color orange = color(245, 173, 148);
color white = color(255);

color[] colors = {blue, pink, orange};

class Ball {

  float position_x, position_y, sum;
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
    ellipse(position_x, position_y, size, size);
  }

  float getArea() {
    sum =0;
    int index = 0;
    if (index < balls.length) {
      float area = PI * pow(size/2, 2);
      sum += area;
      index += 1;
    }
    return sum;
  }
}

Ball[] balls = new Ball[2];

void setup() {
  size(400, 400);
  for (int i = 0; i < balls.length; i++) {
    int rand_color = int(random(colors.length));
    balls[i] = new Ball(30*i+40, 30*i+40, 20*i+40, rand_color);
  }
  balls[balls.length-1].getArea();
 println("Sum of area of all Ball : " + balls[balls.length -1].sum); 
}

void draw() {
  background(white);

  for (int i = 0; i < balls.length;i++) {
    if (i < balls.length){
      balls[i].draw();
      balls[i].getArea();
      
    }
    else {
   
    }
  }
  
}
void mouseClicked() {
  Ball[] lsball1;
  Ball[] lsball2;
  for (int i = balls.length-1; i>=0; i--) {
    float distance = dist(balls[i].position_x, balls[i].position_y, mouseX, mouseY);
    if (distance< (balls[i].size)/2) {
       lsball1 = (Ball[])subset(balls,0,i);
       lsball2 = (Ball[])subset(balls,i+1);
        balls =  (Ball[])concat(lsball1,lsball2);
    if (balls.length == 0){
        println("Sum of area of all Ball :  0 ");
  }  else {
        println("Sum of area of all Ball : " + balls[balls.length -1].sum);
  }
        
        break;
    }
  }
  
}
