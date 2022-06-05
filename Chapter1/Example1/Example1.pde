Mover mover;

//[full] Remember how Processing works?  setup() is executed once when the sketch starts and draw() loops forever and ever (until you quit).
void setup() {
  size(640,360);
  mover = new Mover();
}
//[end]

void draw() {
  background(255);

  mover.update();
  mover.checkEdges();
  mover.display();
}
