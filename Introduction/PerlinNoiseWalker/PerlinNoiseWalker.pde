Walker w;
import java.util.*;

Random generator;

class Walker{
  float x,y,tx,ty;
  
  Walker(){
    tx=0;
    ty=10000;
  }

  void display(){
    ellipse(x,y,16,16);
  }
  
    void step() {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    
    
    tx += 0.01;
    ty += 0.01;
  }
  
}

void setup() {
  size(1000,1000);
  generator = new Random();
  // Create the Walker.
  w = new Walker();  //[bold]
  background(255);
}

void draw() {
  //[full] Call functions on the Walker.
  w.step(); //[bold]
  w.display(); //[bold]
  //[end]
}
