Mover[] movers = new Mover[100];
PVector gravity,wind;
float c = 0.1;
Liquid liquid;

void setup() {
  size(640,360);
  
  //[offset-up] Initialize a Liquid object.  Note the coefficient is low (0.1), otherwise the object would come to a halt fairly quickly (which may someday be the effect you want).
  liquid = new Liquid(0, height/2, width, height/2, 0.2);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1,5),random(width),0);
   }
  wind = new PVector(0.1,0);
}
//[end]

void draw() {
  background(255);
  
  /* PERLIN NOISE WIND
  wind = new PVector(map(noise(t),0,1,-1,1),0);
  wind.normalize();
  wind.mult(0.1);*/
  
  liquid.display();
  
  for (int i = 0; i < movers.length; i++) {
    
    if (movers[i].isInside(liquid)){
      movers[i].drag(liquid);
    }
    
    float m = movers[i].mass;
    gravity = new PVector(0,0.1*m);
    movers[i].applyForce(gravity);
    //movers[i].applyForce(wind);
    
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

  //t += 0.01;
}
