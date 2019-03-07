//MAJOR PROPS TO ETHAN, CHRIS, AND JOE FOR HELPING IN TIME OF NEED,,,COULDNT HAVE DONE IT WITHOUT YOU GUYS
//THIS GAME RESEMBLES SNAKE,,,GOOD LUCK


snake player;
pellet food;
void setup () {
  ellipseMode(RADIUS);
  size (800, 600);
  frameRate(15);
  player = new snake();
  food = new pellet();
}


// calling the check collide method, we are passing it our player size, our pellet size, and the distance between the two
void draw() {
  background (0, 50, 0);

  //score board 
  //noFill();
  strokeWeight(0);
  //rect(0,0,50,50);
  //strokeWeight(0);
  fill(0);
  textSize(50);
  text(player.tail, 10, 43);

  if (player.dead) {
    text("you suck brah", 230, 300);
    text("hit spacebar to restart", 140, 400);
    return;
  } 


  player.slither();
  player.be();
  food.be();
  if (checkCollide(player.size, food.pelletSize, dist(player.xPos, player.yPos, food.xPosPellet, food.yPosPellet))) {

    food.collide();
    player.grow();
  }
  player.checkCollide();
}

void keyPressed() {
  if (key == 'a' ) {
    player.direction  = 0;
  }
  if ( key == 'd') {
    player.direction = 1 ;
  }
  if (key == 'w' ) {
    player.direction = 2;
  }

  if (key == 's' ) {
    player.direction = 3;
  }
  if (key == ' ' && player.dead ) {
    player=new snake();
  }
}
public boolean checkCollide(float playerSize, float pelletSize, float distance) {

  //throwing it and catching it 
  //float playerSize1, pelletSize1, distance1;
  //playerSize1=playerSize;
  //pelletSize1=pelletSize;
  //distance1= distance;

  boolean bucket=false;
  if (playerSize+pelletSize>distance) {
    bucket = true;
  }
  return bucket;
}
