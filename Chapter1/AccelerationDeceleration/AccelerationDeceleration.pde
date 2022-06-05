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

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      mover.updateAcc();
      mover.checkEdges();
      mover.display();
    } else if (keyCode == DOWN) {
      mover.updateBra();
      mover.checkEdges();
      mover.display();
    } 
  } else {
    mover.update();
    mover.checkEdges();
    mover.display();
  }
}
