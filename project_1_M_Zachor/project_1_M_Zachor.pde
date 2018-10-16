OtherCircles group1;
OtherCircles group2;
OtherCircles group3;
MainCircle circle1;

int circleDim = 50;
int xLocCirc = 250;
int yLocCirc = 250;
int xLocGroup1 = 300;
int yLocGroup1 = 175;
int xLocGroup2 = 100;
int yLocGroup2 = 300;
int xLocGroup3 = 200;
int yLocGroup3 = 400;
int circSpeed = 2;
color otherFill1 = color(random(255), random(255), random(255));
color otherFill2 = color(random(255), random(255), random(255));
color otherFill3 = color(random(255), random(255), random(255));
String s = "w = up, s = down, a = left, d = right";
float w = 1.0;

void setup() {
  size(500, 500);
  group1 = new OtherCircles(xLocGroup1, yLocGroup1);
  group2 = new OtherCircles(xLocGroup2, yLocGroup2);
  group3 = new OtherCircles(xLocGroup3, yLocGroup3);
  circle1 = new MainCircle();
}

void draw() {
  println(millis());
  if (millis() < 15000){
  background(75);
  fill(255);
  text(s, 50, 50);
  circle1.display(circleDim);
  group1.display(otherFill1);
  group2.display(otherFill2);
  group3.display(otherFill3);
}
else {
  xLocCirc = width/2;
  yLocCirc = height/2;
  boolean circleGrows = true;
  background(75);
  circle1.display(circleDim);
  if (circleDim == 300) {
    circleGrows = !circleGrows;
    strokeWeight(4);
  point(width/2 - 75, height/2 - 60);
  point(width/2 + 75, height/2 - 60);
  line(width/2 - 75, height/2 + 60, width/2 + 75, height/2 + 60);
  }
  if (circleGrows) {
    circleDim+=5;
  }
}
}

class MainCircle {
  MainCircle(){
  }
  void display(int circleSize){
    strokeWeight(4);
  stroke(0);
  fill(255);
  ellipse(xLocCirc, yLocCirc, circleSize, circleSize);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      yLocCirc = yLocCirc - circSpeed;
    }
    if (key == 's' || key == 'S') {
      yLocCirc = yLocCirc + circSpeed;
    }
    if (key == 'd' || key == 'D') {
      xLocCirc = xLocCirc + circSpeed;
    }
    if (key == 'a' || key == 'A') {
      xLocCirc = xLocCirc - circSpeed;
    }
  }
  if (yLocCirc > height + 50){
    yLocCirc = -50;
  }
  else if (yLocCirc < -50){
    yLocCirc = height+50;
  }
  if (xLocCirc > width + 50){
    xLocCirc = -50;
  }
  else if (xLocCirc < -50){
    xLocCirc = width+50;
  }
  }
}

class OtherCircles {
  int x;
  int y;
  OtherCircles(int xOther, int yOther){
  x = xOther;
  y = yOther;
  }
  void display(color otherCirclesFill){
  int i;
  int j;
  for (i = x; i<x + 151; i+=50) {
    for (j = y; j>y - 151; j-=55) {
      fill(otherCirclesFill);
      ellipse(i + random(-1, 1), j + random(-1, 1), 50, 50);
    }
  }
  if (((xLocCirc > x - 75) && (xLocCirc < x + 150)) && (yLocCirc > y-150) && (yLocCirc < y + 50)) {
    x = x + 50;
  }
  else if (((xLocCirc < x + 220) && (xLocCirc > x)) && (yLocCirc > y-150) && (yLocCirc < y + 50)) {
    x = x - 50;
  }
  else if (((yLocCirc > y - 120) && (yLocCirc < y + 75)) && (xLocCirc > x-55) && (xLocCirc < x + 150)) {
    y = y - 50;
  }
  else if (((yLocCirc < y) && (yLocCirc > y - 175)) && (xLocCirc > x-55) && (xLocCirc < x + 150)) {
    y = y + 50;
  }
  if (x > width){
    x = 0;
  }
  else if (x < -150){
    x = width-150;
  }
  if (y < 0){
    y = height;
  }
  else if (y > height + 100){
    y = 100;
  }
  }
}
