Fly[] Flys = new Fly[10];

Fish[] Fishes = new Fish[5];

Snake[] Snakes = new Snake[3];

//[full] Remember how Processing works?  setup() is executed once when the sketch starts and draw() loops forever and ever (until you quit).
void setup() {
  size(1000,1000);
  for (int i = 0;i < Flys.length; i++){
    Flys[i] = new Fly();
  }
  
  for (int i = 0;i < Fishes.length; i++){
    Fishes[i] = new Fish();
  }
  
  for (int i = 0;i < Snakes.length; i++){
    Snakes[i] = new Snake();
  }

}
//[end]

void draw() {
  background(255);

  for (int i = 0;i < Flys.length; i++){
    Flys[i].update();
    Flys[i].checkEdges();
    Flys[i].display();
  }
  
  for (int i = 0;i < Fishes.length; i++){
    Fishes[i].update();
    Fishes[i].checkEdges();
    Fishes[i].display();
  }
  
  for (int i = 0;i < Snakes.length; i++){
    Snakes[i].update();
    Snakes[i].checkEdges();
    Snakes[i].display();
  }

}
