OtherCircles group;

int xLocCirc = 250;
int yLocCirc = 250;
int xLocOther = 300;
int yLocOther = 175;
int circSpeed = 2;
color otherFill = color(random(255), random(255), random(255));

void setup() {
  size(500, 500);
  group = new OtherCircles();
}

void draw() {
  background(255);
  strokeWeight(4);
  stroke(0);
  fill(255);
  ellipse(xLocCirc, yLocCirc, 50, 50);
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
  group.display();
  if (((xLocCirc > xLocOther - 55) && (xLocCirc < xLocOther + 150)) && (yLocCirc > yLocOther-110) && (yLocCirc < yLocOther + 50)) {
    xLocOther = xLocOther + 50;
  }
  else if (((xLocCirc < xLocOther + 205) && (xLocCirc > xLocOther)) && (yLocCirc > yLocOther-110) && (yLocCirc < yLocOther + 50)) {
    xLocOther = xLocOther - 50;
  }
  else if (((yLocCirc > yLocOther - 150) && (yLocCirc < yLocOther + 55)) && (xLocCirc > xLocOther-55) && (xLocCirc < xLocOther + 150)) {
    yLocOther = yLocOther - 50;
  }
  else if (((yLocCirc < yLocOther) && (yLocCirc > yLocOther - 160)) && (xLocCirc > xLocOther-55) && (xLocCirc < xLocOther + 150)) {
    yLocOther = yLocOther + 50;
  }
  if (xLocOther > width){
    xLocOther = 0;
  }
  else if (xLocOther < -150){
    xLocOther = width-150;
  }
  if (yLocOther < 0){
    yLocOther = height;
  }
  else if (yLocOther > height + 100){
    yLocOther = 100;
  }
}

class OtherCircles {
  OtherCircles(){
  }
  void display(){
  int i;
  int j;
  for (i = xLocOther; i<xLocOther + 151; i+=50) {
    for (j = yLocOther; j>yLocOther - 151; j-=55) {
      fill(otherFill);
      ellipse(i + random(-1, 1), j + random(-1, 1), 50, 50);
    }
  }
  }
}
