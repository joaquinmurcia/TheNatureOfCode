Mover[] movers = new Mover[5];

//[full] Remember how Processing works?  setup() is executed once when the sketch starts and draw() loops forever and ever (until you quit).
void setup() {
  size(640,360);
  for (int i = 0;i < movers.length; i++){
    movers[i] = new Mover();
  }
  
}
//[end]

void draw() {
  background(255);
  
  for (int i = 0;i < movers.length; i++){
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  
}
