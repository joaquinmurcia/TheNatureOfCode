Mover[] movers = new Mover[100];
PVector gravity,wind,friction;
float t;
float c = 0.001; //Friction coeficient
float normal = 1;
float cnorm;

void setup() {
  size(640,360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),0,0);
   }
  wind = new PVector(0.001,0);
  t = 0;

  cnorm = normal * c;

}
//[end]

void draw() {
  background(255);

  /* PERLIN NOISE WIND
  wind = new PVector(map(noise(t),0,1,-1,1),0);
  wind.normalize();
  wind.mult(0.1);*/

  for (int i = 0; i < movers.length; i++) {
    
    /*Here we define two pockets of air with different air resistances*/
    if(movers[i].location.x < width/2 & movers[i].location.y < height/2){
      PVector friction = movers[i].velocity.get();
      friction.mult(-1);
      friction.normalize();
      friction.mult(cnorm);
      movers[i].applyForce(friction);
    } else if(movers[i].location.x > width/2 & movers[i].location.y > height/2){
      PVector friction = movers[i].velocity.get();
      friction.mult(-1);
      friction.normalize();
      friction.mult(cnorm);
      movers[i].applyForce(friction);
      /*In this pocket the air goes in favour of the balls*/
    } else if(movers[i].location.x > width/2 & movers[i].location.y < height/2){
      PVector friction = movers[i].velocity.get();
      friction.normalize();
      friction.mult(cnorm);
      movers[i].applyForce(friction);
    }

    float m = movers[i].mass;
    gravity = new PVector(0,0.1*m);

    movers[i].applyForce(gravity);
    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

  //t += 0.01;
}
