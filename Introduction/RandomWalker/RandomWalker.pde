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
    float num = (float) generator.nextGaussian();
    float sd = 4;
    float mean = 2;
   
    float stepLength = sd * num + mean;
    //[full] Yields -1, 0, or 1
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    //[end]
    x += stepLength*stepx;
    y += stepLength*stepy;
    
    print(stepLength*stepx + "\n");
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
