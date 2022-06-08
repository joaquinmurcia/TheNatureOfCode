abstract class Entity{

    PVector location;

    float des; //Measures the desirableness of a certain entity, how attractive this item is to the others;
    float mass; //Counters physical forces applied over the entity

    Entity(float desirableness,float m, float x, float y){
        location = new PVector(x,y);
        des = desirableness;
        mass = m;
    }

    /*Methods to be implemented in each sub-class*/


    /*Default methods*/
    void display(){
        stroke(0);
        fill(175);
        ellipse(location.x,location.y,mass*16,mass*16);
    }

    PVector attract(Entity e){

      PVector force = PVector.sub(location,e.location);

      float distance = force.mag();
      distance = constrain(distance,5,25);

      float mag = (des*e.des)/(distance*distance);
      /*If multiplied by -1, movers become repulsers.
        If not, every mover will be an attractor for all others movers.*/
      //mag = (-1) * mag;

      force.normalize();
      force.mult(mag);

      return force;
    }

}
