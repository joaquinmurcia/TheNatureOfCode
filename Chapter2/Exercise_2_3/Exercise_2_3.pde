Mover[] movers = new Mover[100];
PVector gravity,wind,counterR,counterL;

void setup() {
  size(640,360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),width/2,height/2);
   }
  gravity = new PVector(0,0.1);
  wind = new PVector(0.01,0);
  counterR = new PVector (-0.01,0);
  counterL = new PVector (0.1,0);
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i].applyForce(gravity);
    movers[i].applyForce(wind);
    
    if (movers[i].location.x > width/2){
        counterL.mult(0);
        counterR.mult(-movers[i].location.x/width);
        movers[i].applyForce(counterR);
    } else if (movers[i].location.x < width/2){
        counterR.mult(0);
        counterL.mult(movers[i].location.x);
        movers[i].applyForce(counterL);
    }
    
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

  //t += 0.01;
}
