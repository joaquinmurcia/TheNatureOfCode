class Fish{

  PVector location;
  PVector speed;
  PVector acceleration;
  PVector mouse;
  PVector dir;
  float mod;
  float lim;

  float ax;
  float ay;

  Fish(){
      location = new PVector(random(width/2,width),random(height/2,height));
      speed = new PVector(0,0);

      ax = random(0,100);
      ay = random(10000,11000);

      lim = 3;
  }

  void update(){
      //acceleration = PVector.random2D();
      acceleration = new PVector(map(noise(ax),0,1,-1,1),map(noise(ay),0,1,-1,1));
      acceleration.normalize();
      acceleration.mult(0.1);

      ax += 0.01;
      ay += 0.01;

      /*mouse = new PVector(mouseX,mouseY);
      dir = PVector.sub(mouse,location);

      mod = dir.mag();
      dir.normalize();
      dir.div(mod/20);

      acceleration = dir;*/

      speed.add(acceleration);
      speed.limit(lim);
      location.add(speed);
  }

  void display(){
      stroke(0);
      fill(0,0,255);
      ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    //[full] When it reaches one edge, set location to the other.
    //[full] When it reaches one edge, set location to the other.
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
    //[end]

  }

}
