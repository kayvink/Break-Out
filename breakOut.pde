// This creates an empty array to hold the brick objects once they are created.
Brick[] myBricks;

// This creates variables for the location of the bouncing ball and the radius of the ball.
int circleX;
int circleY;
int circleR;
int brickCount;

// This create variables that control the speed of the ball.
int Xspeed;
int Yspeed;

// This creates variales for the moveable block at the bottom.
int rectX;
int rectY;
int rectW;
int rectH;

// First you use the create font tool that places a font file in your data directory. Then you declare
// an object of type font. Processing then makes the letters into pictures.
PFont loserFont;
PFont countFont;


void setup (){
  size(400, 400);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
// This code creates the bricks. It uses the startX and startY as the positions for the first brick. The code
// then creates an array of size 50, as it runs through the loops new bricks are created with random colors
// and their locations. These new bricks are then loaded into the array to store them. startX and startY are
// constantly updated as the code builds one row of bricks then resets and builds the second, etc...
  int startX = 20;
  int startY = 40;
  myBricks = new Brick[50];
  for( int i=0; i<10; i++ ) {
    myBricks[i] = new Brick(color(random(30,255),random(30,255),random(30,255)), startX, startY);
    startX += 40;
  }
  startX = 20;
  startY = 60;
  for( int i=10; i<20; i++) {
    myBricks[i] = new Brick(color(random(30,255),random(30,255),random(30,255)), startX, startY);
    startX += 40;
  }
  startX = 20;
  startY = 80;
  for( int i=20; i<30; i++) {
    myBricks[i] = new Brick(color(random(30,255),random(30,255),random(30,255)), startX, startY);
    startX += 40;
  }
  startX = 20;
  startY = 100;
  for( int i=30; i<40; i++) {
    myBricks[i] = new Brick(color(random(30,255),random(30,255),random(30,255)), startX, startY);
    startX += 40;
  }
  startX = 20;
  startY = 120;
  for( int i=40; i<50; i++) {
    myBricks[i] = new Brick(color(random(30,255),random(30,255),random(30,255)), startX, startY);
    startX += 40;
  }
  
  // Here the fonts are loaded into the program (this is basically loading pictures so doing this in 
  // draw could realy slow your program down. (see "Learning Processing" page 309 for a step by step
  // guide and explanation).
  loserFont = loadFont("BankGothic-Medium-70.vlw");
  countFont = loadFont("BankGothic-Medium-30.vlw");
 
  
  // This declares the initial position of the ball and initial count of bricks.
  circleX = width/2;
  circleY = height;
  brickCount = 0;
  
  // This declares the static variables (ball Radius, size of bricks and speed of the ball and the height
  // the user's brick will stay at).
  circleR = 10;
  rectY = 380;
  Xspeed = 3;
  Yspeed = 3;
  rectW = 70;
  rectH = 10;
}

void draw(){
  rectX = mouseX;
  
  background(0);
  stroke(255);
  fill(255);
  ellipse(circleX, circleY - circleR, 2*circleR, 2*circleR);
  
  // By adding movement to the static location of the ball it starts moving
  circleX = circleX + Xspeed;
  circleY = circleY - Yspeed;
  
  // By changing the direction of the ball each time it reaches the edges of the screen we create
  // a boundary. The circleR is added to correct for the bit of the ball that would go out of the screen
  // because you are coding around the x and y location of the center of the ball.
  if(circleX > width - circleR || circleX - circleR < 0){
    Xspeed = Xspeed * -1;
  }
  if (circleY < 0 + circleR){
    Yspeed = Yspeed * -1;
  } else if(circleY > height + 40 && brickCount < 50){ //Here we add a message for the user if he loses the game
    fill(255, 0, 0);
    textFont (loserFont, 70);
    text("YOU LOSE", 0, height/2);
  }
  
  // This code runs the logic of the game. By iterating over the array of bricks every brick is told to display
  // (if the correct conditions exist) and the hit method is called to test if a brick has been hit by the ball.
  for(int i=0; i<myBricks.length; i++){
    myBricks[i].display();
    myBricks[i].hit(circleX,circleY,circleR);
  }
  
  
  // This draws the moveable block at the bottom.
  fill(255);
  rect(rectX, rectY, rectW, rectH);
  
  if(circleX > mouseX - rectW/2 && circleX < mouseX + rectW/2 && circleY >= 380 && circleY <= height ){
   Yspeed *= -1; 
  }
  
  // This creates a scorecount in the top corner.
  fill (0, 255, 0);
  textFont (countFont, 30);
  text(brickCount, width-70, 20);
  
  if(brickCount == 50){
    fill(0,255, 0);
    textFont (loserFont, 70);
    text("YOU WIN!", 0, height/2);
  }
 }
 


  
