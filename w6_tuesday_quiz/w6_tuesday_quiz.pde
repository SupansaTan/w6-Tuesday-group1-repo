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
  int get_color;

  Ball(float tempx, float tempy, int tempSize, int rand_color) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    get_color = rand_color;
  }

  void draw() {
    fill(colors[get_color]);
    //stroke(colors[get_color]);
    ellipse(position_x, position_y, size, size);
  }

  float getArea() {
    float area = 22/7 * (size/2) * (size/2);
    return area;
  }
}

class Box {
  float position_x, position_y;
  int size;
  int get_color;

  Box(float tempx, float tempy, int tempSize, int rand_color) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    get_color = rand_color;
  }

  void draw() {
    fill(colors[get_color]);
    //stroke(colors[get_color]);
    rect(position_x+100, position_y, size, size);
  }

  float getArea() {
    float area = 22/7 * (size/2) * (size/2);
    return area;
  }
}

Ball[] balls = new Ball[5];
Box[] boxes = new Box[5];

void setup() {
  size(400, 400);
  for (int i = 0; i < balls.length; i++) {
    int rand_color = int(random(colors.length));
    balls[i] = new Ball(30*i+40, 30*i+40, 20*i+40, rand_color);
  }
  for (Ball ball : balls) {
    sum += ball.getArea();
  }
  for (int j = 0; j < boxes.length; j++) {
    int rand_color = int(random(colors.length));
    boxes[j] = new Box(30*j+40, 30*j+40, 20*j+40, rand_color);
  }
  for (Box box : boxes) {
    sum += box.getArea();
  }
  println("Sum of all area is : ", sum);
}

void draw() {
  background(white);
  for (Ball ball : balls) {
    ball.draw();
  }
  for (Box box : boxes) {
    box.draw();
  }
}

void mouseClicked() {
  Ball[] lsball1;
  Ball[] lsball2;
  Box[] lsbox1;
  Box[] lsbox2;
  check = true;
  
  for (int i = balls.length-1; i>=0; i--) {
    float distance_ball = dist(mouseX, mouseY, balls[i].position_x, balls[i].position_y);
    if (distance_ball < (balls[i].size)/2) {
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
      if (mouseX > boxes[j].position_x &&  mouseX < boxes[j].position_x + (boxes[j].size)*3 && mouseY > boxes[j].position_y &&  mouseY < boxes[j].position_y + (boxes[j].size)*3) {
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
