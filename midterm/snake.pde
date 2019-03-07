//variables 
//props to ethan, and chris 
public class snake {
  public float xPos;
  public float yPos; 
  public int size;
  public int tail;
  public int speed ;
  public color scales ; 
  public color segments;
  public int direction;
  //2 dimensial arrays
  public float [][] positions;
  public boolean dead;



  //my constructor  

  snake() {
    xPos= width/2;
    yPos= height/2;
    size= 15;
    tail = 0;
    speed = size;
    scales= color(0, 0, 0);
    segments = color(255);
    direction = -1;
    //2 dimensial array/matrix, each row is x,y
    positions=new float [1000][2] ;
    positions [0][0]=xPos;
    positions [0][1]=yPos;
    dead=false;
  }

  void slither() {
    //this is movement
    switch(direction) {
    case 0: 
      xPos = xPos - speed;
      break; 
    case 1: 
      xPos = xPos + speed ; 
      break;
    case 2:
      yPos = yPos - speed;
      break;
    case 3:
      yPos = yPos + speed ; 
      break ;
    }

    //this where making the logic for the movement of the segments 
    //this is also putting the position of the head into the array trying to loop for each subsequent segment 
    for (int i=tail; i>=0; i--) {
      if (i==0) {
        positions [i][0]=xPos;
        positions [i][1]=yPos;
        continue;
      }
      positions[i][0] = positions[i-1][0];
      positions[i][1] = positions[i-1][1];
    }



    //stay on screen 
    if (direction==0 && xPos<size) {
      //xPos = xPos - 7;
      speed =0;
      dead=true;
    }
    if ( direction==1 && xPos>width-size) {
      //xPos = xPos + 7;
      speed = 0;
      dead=true;
    }
    if (direction==2 && yPos<size) {
      //yPos = yPos - 7;
      speed = 0;
      dead=true;
    }
    if (direction==3 && yPos>height-size) {
      // yPos = yPos + 7;
      speed = 0;
      dead=true;
    }
  }


  void be() {
    //ellipseMode (CENTER); 
    //this will render all my segments
    for (int i = tail; i >= 0; i--) {
      fill(i == 0 ? scales : segments);
      float[] segment = positions[i];
      ellipse(segment[0], segment[1], size, size);
    }
  }

  void checkCollide() {
    for (int i=3; i<=tail; i++) {
      float[] segment=positions[i];
      float[] head=positions[0];
      //checking the distance between center points of the tail and head and doing a doifferential opperation in absolute value
      if(Math.abs(segment[0] - head[0]) < size * 2.0f && Math.abs(segment[1] - head[1]) < size * 2.0f) dead = true;
    }
  }

  void eat() {
  }
  void grow() {
    //this is going to copy the heaad , and keep it under the head until i tell it to move to an initial position 
    tail++;
    positions[tail][0]= positions [tail-1][0];
    positions[tail][1]= positions [tail-1][1];
  }
  void dance() {
  }
}
