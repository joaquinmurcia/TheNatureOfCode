void setup() {
  size(1000,1000);
  background(255);
}

int zoff = 0; //[bold]
void draw() {
loadPixels();
/*for (int x = 0; x < width; x++) {
  for (int y = 0; y < height; y++) {
    // A random brightness!
    //float bright = random(255);
    float bright = map(noise(x,y),0,1,0,255);
    pixels[x+y*width] = color(bright);
  }
}*/

// Start xoff at 0.
float xoff = 0.0; //[bold]

for (int x = 0; x < width; x++) {
  // For every xoff, start yoff at 0.
  float yoff = 0.0; //[bold]

  for (int y = 0; y < height; y++) {
    // Use xoff and yoff for noise().
    float bright = map(noise(xoff,yoff,zoff),0,1,0,255); //[bold]
    noiseDetail(8,0.75);  
    // Use x and y for pixel location.
    pixels[x+y*width] = color(bright);
    // Increment yoff.
    yoff += 0.01; //[bold]
  }
  // Increment xoff.
  xoff += 0.01;  //[bold]
}

updatePixels();
  zoff += 1;
}
