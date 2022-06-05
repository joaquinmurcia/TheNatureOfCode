class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float G;
  
  float mass;

  Mover(float m, float x, float y){
      location = new PVector(x,y);
      velocity = new PVector(1,0);
      acceleration = new PVector(0,0);
      
      mass = m;
      G = 0.4;
  }

  void applyForce(PVector force){
      PVector f = PVector.div(force,mass);
      acceleration.add(f);
  }

  void update(){
      velocity.add(acceleration);
      location.add(velocity);
      acceleration.mult(0);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }

  }

  void display(){
      stroke(0);
      fill(175);
      ellipse(location.x,location.y,mass*16,mass*16);
  }
  
  PVector attract(Mover m){
    
    PVector force = PVector.sub(location,m.location);

    float distance = force.mag();
    distance = constrain(distance,5,25);
    
    float mag = (G*mass*m.mass)/(distance*distance);
    /*If multiplied by -1, movers become repulsers.
      If not, every mover will be an attractor for all others movers.*/
    //mag = (-1) * mag;
    
    force.normalize();
    force.mult(mag);
    
    return force;
  }
  

}
