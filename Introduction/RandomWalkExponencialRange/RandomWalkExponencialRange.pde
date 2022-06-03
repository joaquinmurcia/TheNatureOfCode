Walker w;
import java.util.*;

Random generator;

class Walker{
  int x;
  int y;
  
  Walker(){
    x = width/2;
    y = height/2;
  }

  void display(){
    stroke(0);
    point(x,y);
  }
  
    void step() {
      
      
    // A uniform distribution of step sizes. Change this!
    float stepsize = int((random(0,10)))^2;
  
    float stepx = random(-stepsize,stepsize);
    float stepy = random(-stepsize,stepsize);
  
    x += stepx;
    y += stepy; 
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
