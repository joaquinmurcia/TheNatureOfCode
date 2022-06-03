class Fly{

  PVector location;
  PVector speed;
  PVector acceleration;
  PVector mouse;
  PVector dir;
  float mod;
  float lim;

  float ax;
  float ay;

  Fly(){
      location = new PVector(random(width),random(height));
      speed = new PVector(0,0);
      
      ax = random(0,100);
      ay = random(10000,11000);

      lim = 5;
  }

  void update(){
      acceleration = PVector.random2D();
      /*acceleration = new PVector(noise(ax),noise(ay));
      acceleration.normalize();
      acceleration.mult(0.5);

      ax += 0.1;
      ay += 0.1;*/

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
      fill(0);
      ellipse(location.x,location.y,10,10);
  }

  void checkEdges() {

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
