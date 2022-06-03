Walker w;

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
    //[full] Yields -1, 0, or 1
    int[] stepsy = {0,-1,-1,1};
    int[] stepsx = {0,1,1,-1};
    int indexx = int(random(stepsy.length));
    int indexy = int(random(stepsx.length));
    //[end]
    x += stepsx[indexx];
    y += stepsy[indexy];
  }
  
}

void setup() {
  size(1000,1000);
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
