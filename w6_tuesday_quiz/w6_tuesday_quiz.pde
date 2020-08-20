color blue = color(20, 80, 255);
color pink = color(255, 100, 150);
color orange = color(255, 150, 80);
color white = color(255);

color[] colors = {blue, pink, orange};

float sum;
boolean check;

class Ball {
  float position_x, position_y;
  int size;
  int shade;
  int twinkling;

  Ball(float tempx, float tempy, int tempSize, int tempColor) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    shade = tempColor;
    twinkling = 0;
  }

  void draw() {
    if (twinkling == 1) {
      fill(0);
      ellipse(position_x, position_y, size, size);
    }
    else {
      shade = int(random(colors.length));
      fill(colors[shade]);
      ellipse(position_x, position_y, size, size);
    }
  }

  float getArea() {
    float area = 22/7 * (size/2) * (size/2);
    return area;
  }
}

class Box {
  float position_x, position_y;
  int size;
  int shade;
  int twinkling;
  Ball[] ballss = new Ball[int(random(1,10))];

  Box(float tempx, float tempy, int tempSize, int tempColor) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    shade = tempColor;
    twinkling = 1;
  }
  
  void setBall(){
    for(int i=0; i < ballss.length; i++){
      ballss[i] = new Ball(int(random(position_x+(size/4),position_x+size-(size/4))), int(random(position_y+(size/4),position_y+size-(size/4))), int(random(20,(size/2))), twinkling);
    }
    
    for(Ball ball : ballss){
      ball.draw();
    }
  }

  void draw() {
    if (twinkling == 1) {
      fill(0);
      rect(position_x, position_y, size, size);
    }
    else {
      shade = int(random(colors.length));
      fill(colors[shade]);
      rect(position_x, position_y, size, size);
    }
  }

  float getArea() {
    float area = 22/7 * (size/2) * (size/2);
    return area;
  }
}

Ball[] balls = new Ball[int(random(3,8))];
Box[] boxes = new Box[int(random(1,5))];

void setup() {
  size(400, 400);
  
  for (int j = 0; j < boxes.length; j++) {
    int tempColor = int(random(colors.length));
    boxes[j] = new Box(int(random(width/2)), int(random(height/2)), int(random(100,200)), tempColor);
  }
  
  for (Box box : boxes) {
    box.draw();
    box.setBall();
    sum += box.getArea();
  }
  
  println("Sum of all area is : ", sum);
}

void draw() {
}

void mouseClicked() {
  Ball[] lsball1;
  Ball[] lsball2;
  Box[] lsbox1;
  Box[] lsbox2;
  check = true;
  
  for (int i = balls.length-1; i>=0; i--) {
    float distance_ball = dist(mouseX, mouseY, balls[i].position_x, balls[i].position_y);
    if (distance_ball < (balls[i].size)/2 && balls[i].twinkling == 0) {
      sum -= balls[i].getArea();
      println("Sum of all area is : ", sum);
      lsball1 = (Ball[])subset(balls,0,i);
      lsball2 = (Ball[])subset(balls,i+1);
      balls =  (Ball[])concat(lsball1,lsball2);
      check = false;
      break;
    }
  }
    
  if (check == true)  {
    for (int j = boxes.length-1; j>=0; j--) {
      if (mouseX > boxes[j].position_x &&  mouseX < boxes[j].position_x + (boxes[j].size)*3 && mouseY > boxes[j].position_y &&  mouseY < boxes[j].position_y + (boxes[j].size)*3 && boxes[j].twinkling == 0) {
        sum -= boxes[j].getArea();
        println("Sum of all area is : ", sum);
        lsbox1 = (Box[])subset(boxes,0,j);
        lsbox2 = (Box[])subset(boxes,j+1);
        boxes =  (Box[])concat(lsbox1,lsbox2);
        check = false;
        break;
      }
    }
  }
}
