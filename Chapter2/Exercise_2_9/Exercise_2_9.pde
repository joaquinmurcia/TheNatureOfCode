Mover[] movers = new Mover[1];
Attractor[] attractors = new Attractor[1];

void setup(){
  size(1000,1000);
  background(255);
  
  for (int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(0.1,2), random(width), random(height));
  }
  
  
  for (int i = 0; i<attractors.length; i++){
    attractors[i] = new Attractor((i+1)*width/(attractors.length+1),height/2,(i+1)*20);
  }
}

void draw(){
  //background(255);
  
  for (int i = 0; i<movers.length; i++){
    for (int j = 0; j<attractors.length; j++){
      PVector f = attractors[j].attract(movers[i]);
      movers[i].applyForce(f);
    }
    
    movers[i].update();
    
    movers[i].display();
  }
  
  for (int i = 0; i<attractors.length; i++){
    attractors[i].drag();
    attractors[i].hover(mouseX,mouseY);
    
    attractors[i].display();
  }

}

void mousePressed(){
  for (int i = 0; i<attractors.length; i++){
    attractors[i].clicked(mouseX,mouseY);
  }
}

void mouseReleased(){
  for (int i = 0; i<attractors.length; i++){
    attractors[i].stopDragging();
  }
}
