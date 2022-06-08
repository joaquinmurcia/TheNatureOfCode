abstract class Animal extends Entity{
    PVector velocity;
    PVector acceleration;
    float lim;

    Animal(float des,float m,float limitSpeed, float x, float y, PVector vel, PVector acc){
        super(des,m,x,y);
        velocity = vel;
        acceleration = acc;
        lim = limitSpeed;
    }

    /*Methods to be implemented in each sub-class*/


    /*Default methods*/
    void applyForce(PVector force){
        PVector f = PVector.div(force,des);
        acceleration.add(f);
    }

    void update(){
        velocity.add(acceleration);
        velocity.limit(lim);
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

    boolean isInside(Liquid l) {
      if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
      {
        return true;
      } else {
        return false;
      }
    }

    void drag(Liquid l) {
      float speed = velocity.mag();
      float dragMagnitude = l.c * speed * speed;

      PVector drag = velocity.get();
      drag.mult(-1);
      drag.normalize();

      drag.mult(dragMagnitude);
      applyForce(drag);
    }

}
