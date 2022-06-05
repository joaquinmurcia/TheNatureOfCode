void setup() {
  size(640,360);
}

void draw() {
  background(255);
  //[full] Two PVectors, one for the mouse location and one for the center of the window
  PVector mouse  = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  //[end]
  // PVector subtraction!
  mouse.sub(center);
  mouse.normalize();
  mouse.mult(50);
  
  float m = mouse.mag();
  fill(0);
  rect(0,0,m,10);
  
    // Draw a line to represent the vector.
  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
}
