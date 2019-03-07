public class pellet {
  public float xPosPellet;
  public float yPosPellet; 
  public color nuts ;
  public float pelletSize;
  
  pellet() {
    xPosPellet=random(0,width);
    yPosPellet=random(0,height); 
    nuts= color(255, 3, 3);
    pelletSize=15;
  }
void collide (){

xPosPellet=random(0,width);
yPosPellet=random(0,height);

}









  void be () {
    fill (nuts);
    ellipse (xPosPellet, yPosPellet, pelletSize,pelletSize);
    
  }



}
