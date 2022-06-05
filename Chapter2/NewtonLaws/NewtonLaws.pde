Mover[] movers = new Mover[100];
PVector gravity,wind;
float t;

void setup() {
  size(640,360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),0,0);
   }
  wind = new PVector(0.01,0);
  t = 0;
}
//[end]

void draw() {
  background(255);
  
  /* PERLIN NOISE WIND
  wind = new PVector(map(noise(t),0,1,-1,1),0);
  wind.normalize();
  wind.mult(0.1);*/
  
  for (int i = 0; i < movers.length; i++) {
    float m = movers[i].mass;
    gravity = new PVector(0,0.5*m);
    movers[i].applyForce(gravity);
    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

  //t += 0.01;
}
