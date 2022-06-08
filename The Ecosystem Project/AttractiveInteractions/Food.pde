class Food extends Entity{

    Food(float des,float m, float x, float y){
        super(des,m,x,y);
    }

    Food(){
        super(random(5,15), random(1,5), random(width),random(height));
    }

}
