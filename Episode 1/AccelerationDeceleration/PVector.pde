class PVector {

  float x;
  float y;

  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void add(PVector v) { //[bold]
    y = y + v.y; //[bold]
    x = x + v.x; //[bold]
  } 
  
  void sub(PVector v) {
    x = x - v.x;
    y = y - v.y;
  }
  
  void mult(float n) {
   //[full] With multiplication, the components of the vector are multiplied by a number.
   x = x * n;
   y = y * n;
   //[end]
 }
 
 void div(float n) {
  x = x / n;
  y = y / n;
}

float mag() {
  return sqrt(x*x + y*y);
}

void normalize() {
 float m = mag();
 if (m != 0) {
   div(m);
 }
  
}
  void limit(float lim){
      if(mag() > lim){
          normalize();
          mult(lim);
      }
  }
  
}
