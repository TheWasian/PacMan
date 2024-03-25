float pacX;
float pacY;
float pacSpeed = 3;

//animation variables
float pacAngle = 0;
boolean right = true;

void setup() {
  size(800,200);
  pacY= height/2;
  pacX = width/2;
}

void draw(){
  background(0);
  
  //Blue tracks
  stroke(0, 0, 255);
  strokeWeight(10);
  line(0, height/2 - 50, width, height/2 - 50);
  line(0, height/2 + 50, width, height/2 + 50);
  stroke(0);
  
  //draw pacman  circle
  fill(255,255,0);
  circle(pacX,pacY,40);
  
  //controls whether pacman moves left or right and animation of mouth
  fill(0);
  if(right){
    pacX = (pacX + pacSpeed) % width;
    arc(pacX, pacY, 40.1, 40.1, -pacAngle, pacAngle);
  }
  else if(!right){
    pacX = (pacX - pacSpeed);
    arc(pacX, pacY, 40.1, 40.1, PI - pacAngle, PI +pacAngle);
   if (pacX < 0) {
      pacX = width;
   }
  }
  //resets pacAngle
    pacAngle += 0.035;
  if(pacAngle >= THIRD_PI){
    pacAngle = 0;
  }

}

  
void keyPressed() {
  // Change PacMan's direction when the spacebar is pressed
  if (key == ' ') {
    right = !right;   
    }
}
