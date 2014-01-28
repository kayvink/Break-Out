// This creates a Brick class to create the brick objects for the game.
// It allows for the creation of multiple bricks with similar properites.
class Brick {
  color c;
  int X;
  int Y;
  int bWidth = 40;
  int bHeight = 20;
  boolean alive = true;

// The contructor for the brick class, takes in a color, x positon, and y position.
  Brick(color tempC, int xValue, int yValue) {
    c = tempC;
    X = xValue;
    Y = yValue;
  }
  
// The display function is called to draw the bricks onto the screen.
// It first determines if the brick is 'alive', if it isn't then nothing is displayed.
// If the brick is 'alive' then a rectangle is drawn using the parameters passed into the class earlier.
// You can create your own function and store them if you will be using them more often. See 'Learning
// processing' chapter 7.1 page 101.
  void display() {
    if(alive == true) {
      stroke(0);
      fill(c);
      rect(X,Y,bWidth,bHeight);
    }
  }
  
// The boolean hit is called to determine if there has been contact between the circle and a brick. The logic 
// only applies when 'alive' is set to true. This means the code will ignore bricks that have already been  radius and
// destoryed. It uses the sizes of the two objects to run a comparison and determine if a collision has occurred.
// If a collision has taken place then the block is set to alive=false, the speed of the ball is reversed
// and the 'brickCount' is advanced by one. 
// The logic for distance determination was adapted from example  at http://www.openprocessing.org/sketch/20795
  boolean hit(int cx, int cy, int cr){
    if(alive == true) {
      float circleDistanceX = abs(cx - (X-bWidth/2) - bWidth/2);
      float circleDistanceY = abs(cy - Y - bHeight/2);
 
      if (circleDistanceX > (bWidth/2 + cr)) { return false; }
      if (circleDistanceY > (bHeight/2 + cr)) { return false; }
      if (circleDistanceX <= bWidth/2) { 
        alive = false; 
        Yspeed = Yspeed *-1;
        brickCount += 1;   
        return true; 
      }
      if (circleDistanceY <= bHeight/2) { 
        alive = false; 
        Yspeed = Yspeed * -1; 
        brickCount += 1;
        return true; 
      }
      float cornerDistance = pow(circleDistanceX - bWidth/2, 2) + pow(circleDistanceY - bHeight/2, 2);
      return cornerDistance <= pow(cr, 2);
      }
    return false;
  }
}
