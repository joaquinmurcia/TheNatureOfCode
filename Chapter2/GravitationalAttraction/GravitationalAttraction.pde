Mover[] movers = new Mover[10];
Attractor a;

void setup(){
  size(1000,1000);
  
  for (int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(0.1,2), random(width), random(height));
  }
  
  a = new Attractor();
}

void draw(){
  background(255);
  
  for (int i = 0; i<movers.length; i++){
    PVector f = a.attract(movers[i]);
    movers[i].applyForce(f);
    
    movers[i].update();
    
    movers[i].display();
  }
  
  a.drag();
  a.hover(mouseX,mouseY);
  
  a.display();

}

void mousePressed(){
  a.clicked(mouseX,mouseY);
}

void mouseReleased(){
  a.stopDragging();
}
