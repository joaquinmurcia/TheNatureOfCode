class Fly extends Animal{

  PVector mouse;
  PVector dir;
  float lim;

  Fly(float des, float m, float x, float y){
      super(des,m,5,x,y,new PVector(0,0),new PVector(0,0));

  }

  Fly(float des, float m){
      super(des,m,5,random(width),random(height),new PVector(0,0),new PVector(0,0));

  }

  void updateFly(ArrayList<PVector> forces){
      PVector acc = PVector.random2D();
      acc.normalize();
      acc.mult(random(0,3));

      applyForce(acc);

      for(int i = 0; i < forces.size();i++){
        applyForce(forces.get(i));
      }

  }

}
