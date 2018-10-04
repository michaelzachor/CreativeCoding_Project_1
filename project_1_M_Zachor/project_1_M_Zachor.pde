int xLocCirc = 250;
int yLocCirc = 250;
int xLocOther = 300;
int yLocOther = 175;
color otherFill = color(random(255), random(255), random(255));

void setup(){
  size(500, 500);
}

void draw(){
  background(255);
  strokeWeight(4);
  stroke(0);
  fill(255);
  ellipse(xLocCirc, yLocCirc, 50, 50);
  otherCircles();
}

void otherCircles(){
  for (int i = xLocOther; i<450; i+=50){
    for (int j = yLocOther; j>50; j-=55){
      fill(otherFill);
  ellipse(i + random(-1, 1), j + random(-1, 1), 50, 50);
}
  }
}
