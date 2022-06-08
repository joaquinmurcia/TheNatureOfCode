class Food extends Entity{

    Food(float des,float m, float x, float y){
        super(des,m,x,y);
    }

    Food(){
        super(random(5,15), random(1,5), random(width),random(height));
    }

    void display(){
        stroke(0);
        fill(23, 165, 137);
        ellipse(location.x,location.y,mass*16,mass*16);
    }

}
