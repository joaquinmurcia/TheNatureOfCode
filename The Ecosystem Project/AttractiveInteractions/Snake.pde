class Snake extends Animal{

  float ax;
  float ay;

  Snake(float des, float m, float x, float y){
      super(des,m,3,x,y,new PVector(0,0),new PVector(0,0));

      ax = random(0,100);
      ay = random(10000,11000);
  }

  Snake(float des, float m){
      super(des,m,3,random(width/2,width),random(height/2,height),new PVector(0,0),new PVector(0,0));

      ax = random(0,100);
      ay = random(10000,11000);
  }

  void updateSnake(ArrayList<PVector> forces){
      //acceleration = PVector.random2D();
      PVector acc = new PVector(map(noise(ax),0,1,-1,1),map(noise(ay),0,1,-1,1));
      acc.normalize();
      acc.mult(2);

      ax += 0.01;
      ay += 0.01;

      applyForce(acc);

      for(int i = 0; i < forces.size();i++){
        applyForce(forces.get(i));
      }
  }

  void display(){
      stroke(0);
      fill(0,128,0);
      ellipse(location.x,location.y,20,20);
  }

}
