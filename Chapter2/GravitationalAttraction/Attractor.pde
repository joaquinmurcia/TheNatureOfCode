class Attractor{
  float mass;
  PVector location;
  float G;
  
  boolean dragging = false;
  boolean rollover = false;
  PVector dragOffset;
  
  Attractor(){
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 0.4;
    
    dragOffset = new PVector(0,0);
  }
  
  void display(){
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  PVector attract(Mover m){
    
    PVector force = PVector.sub(location,m.location);

    float distance = force.mag();
    distance = constrain(distance,5,25);
    
    float mag = (G*mass*m.mass)/(distance*distance);
    
    force.normalize();
    force.mult(mag);
    
    return force;
  }
  
  void clicked(float x, float y){
    float d = dist(x,y,location.x,location.y);
    if (d<mass){
      dragging = true;
      dragOffset.x = location.x-x;
      dragOffset.y = location.y-y;
    }
  }
  
  void hover(float x, float y){
    float d = dist(x,y,location.x,location.y);
    if (d<mass){
      rollover = true;
    }else{rollover=false;}
  }
  
  void stopDragging(){
    dragging = false;
  }
  
  void drag(){
    if(dragging){
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
  
}
