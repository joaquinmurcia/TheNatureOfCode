class Mover{

  PVector location;
  PVector speed;
  PVector acceleration;
  PVector brake;
  float lim;

  Mover(){
      location = new PVector(width/2,height/2);
      speed = new PVector(0,0);
      acceleration = new PVector(0.1,0);
      brake = new PVector(-0.1,0);
      lim = 10;
  }

  void updateAcc(){
      speed.add(acceleration);
      speed.limit(lim);
      location.add(speed);
  }
  
  void updateBra(){
      speed.add(brake);
      speed.limit(lim);
      location.add(speed);
  }
  
  void update(){
      speed.limit(lim);
      location.add(speed);
  }

  void display(){
      stroke(0);
      fill(175);
      ellipse(location.x,location.y,16,16);
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
