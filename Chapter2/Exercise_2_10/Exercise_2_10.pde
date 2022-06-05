Mover[] movers = new Mover[30];

void setup(){
  size(400,400);

  for (int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(0.1,2), random(width), random(height));
  }
}

void draw(){
  background(255);

  for (int i = 0; i<movers.length; i++){
    for (int j = 0; j<movers.length; j++){
      if (i!=j){
        PVector r = movers[j].attract(movers[i]);
        movers[i].applyForce(r);
      }
    }

    PVector a = movers[i].mouseAttraction();
    movers[i].applyForce(a);

    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

}
