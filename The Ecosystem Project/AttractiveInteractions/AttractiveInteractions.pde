Fly[] Flys = new Fly[10];

Fish[] Fishes = new Fish[5];

Snake[] Snakes = new Snake[3];

Food[] food = new Food[5];

//[full] Remember how Processing works?  setup() is executed once when the sketch starts and draw() loops forever and ever (until you quit).
void setup() {
  size(1000,1000);
  for (int i = 0;i < Flys.length; i++){
    Flys[i] = new Fly(5,0.5);
  }

  for (int i = 0;i < Fishes.length; i++){
    Fishes[i] = new Fish();
  }

  for (int i = 0;i < Snakes.length; i++){
    Snakes[i] = new Snake();
  }

  for (int i = 0;i < food.length; i++){
    food[i] = new Food();
  }

}
//[end]

void draw() {
  background(255);

  for (int i = 0;i < Flys.length; i++){
    ArrayList<PVector> forces = new ArrayList<PVector>();
    for (int j = 0;j < food.length; j++){
      forces.add(food[j].attract(Flys[i]));
    }
    Flys[i].updateFly(forces);
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

  for (int i = 0;i < food.length; i++){
    food[i].display();
  }


}
