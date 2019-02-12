ArrayList<Snowflake> snow;
float rx = 0, ry = 0, rz = 0, scale = 1;
void setup(){
  size(800,800,P3D);
  snow = new ArrayList<Snowflake>();
  
}
void draw(){
  background(0);
  translate(width/2, height/2, 0);
  snow.add(new Snowflake());
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  scale(scale);
    if(keyPressed){
    if(key == 'z'){
      scale-=0.01;
    }
    if(key == 'x'){
      scale+=0.01;
    }
    if(keyCode == UP){
      rx += 0.01;
    }
    if(keyCode == DOWN){
      rx -= 0.01;
    }
    if(keyCode == LEFT){
     // println(ry);
      ry -= 0.01;
    }
    if(keyCode == RIGHT){
      ry += 0.01;
    }
  
  }
  for(int i = 0; i < snow.size(); i++){
    snow.get(i).display();
    snow.get(i).update();
  }
}

class Snowflake{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  
  Snowflake(){
    float x = random(width);
    float y = random(height);
    float z = random(400);
    location = new PVector(x,y,z);
    velocity = new PVector(0,0.1,0);
    acceleration = new PVector(0,0.001,0);
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void display(){
    stroke(255);
    strokeWeight(4);
    point(this.location.x,this.location.y);
  }
   
}
