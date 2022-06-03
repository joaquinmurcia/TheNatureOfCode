import java.util.*;

Random generator;

void setup() {
  size(640,360);
  generator = new Random();
}

void draw() {
  float num = (float) generator.nextGaussian();
  float sd = 60;
  float mean = 320;
 
  float x = sd * num + mean;
 
  noStroke();
  print(x%256+"\n");
  fill(256-x%256, x%256, 128+x%256);
  ellipse(x,180,16,16);
}
