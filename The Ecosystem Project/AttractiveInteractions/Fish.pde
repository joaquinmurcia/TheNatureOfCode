class Fish extends Animal{

  float ax,ay;

  Fish(float des, float m, float x, float y){
      super(des,m,3,x,y,new PVector(0,0),new PVector(0,0));

      ax = random(0,100);
      ay = random(10000,11000);
  }

  Fish(float des, float m){
      super(des,m,3,random(width/2,width),random(height/2,height),new PVector(0,0),new PVector(0,0));

      ax = random(0,100);
      ay = random(10000,11000);
  }

  void updateFish(ArrayList<PVector> forces){
      //acceleration = PVector.random2D();
      PVector acc = new PVector(map(noise(ax),0,1,-1,1),map(noise(ay),0,1,-1,1));
      acc.normalize();
      acc.mult(0.1);

      ax += 0.01;
      ay += 0.01;

      applyForce(acc);

      for(int i = 0; i < forces.size();i++){
        applyForce(forces.get(i));
      }
  }

  void display(){
      stroke(0);
      fill(0,0,255);
      ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < width/2) {
      velocity.x *= -1;
      location.x = width/2;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }else if (location.y < height/2) {
      velocity.y *= -1;
      location.y = height/2;
    }

  }

}
