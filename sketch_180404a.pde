//n is max number of snow flaks, as snow flaks grow in number program slows down
// as it is cpu based
int n=1000;
int num=0;
int max_radius=20;
int max=0;
int x_max=1600,y_max=900;
//true means older snow flakes will be deleted and new will replace it, total will remain same,
//false means no more flakes will be created
boolean deleteOld=true;

class Point{
  public float x,y,radius;
  public void setValue(float x,float y){
    this.radius=random(max_radius);
    this.x=x;this.y=y;
  }
  public void setValue(){
    this.radius=random(max_radius);
    this.x=random(x_max);
    this.y=random(y_max);
  }
  public void updateValue(){
    if(x<x_max)x+=random(-1,5);
    else x=-10;
    if(y<y_max)y+=random(-1,5);
    else y=-10;
  }
  public void setX(float x){
    this.x=x;
  }
  public void setY(float y){
    this.y=y;
  }
}
Point point[]=new Point[n];
void setup(){
  
  size(1600,900);
  frameRate(60);
  for(int i=0;i<n;i++){
    point[i]=new Point();
  }
  
}

void draw(){

  background(0);
  stroke(255);
  int z=max;
  if(deleteOld)z=n;
  for(int i=0;i<z;i++){
    ellipse(point[i].x,point[i].y,point[i].radius,point[i].radius);
    point[i].updateValue();
  }
  point(200,200);
}
void putter(){
  if(deleteOld){
    point[(++num)%n].setValue(mouseX, mouseY);
    num=num%n;
  }else if(num<n-1){
    println(max);
    max++;
    point[++num].setValue(mouseX,mouseY);
  }
}
void mousePressed() {
  putter();
}
void mouseDragged() {
  putter();
}
void mouseClicked() {
  putter();
}
