float pacX;
float pacY;
float pacSpeed = 2;
boolean right = true;

//animation variables
float pacAngle = 0;
float pacMouth;


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
  //calls on draw pacman function
  drawPac();
  
  //calls on pacman movement function
  pacMovement();
  
  
}

void drawPac(){
  //draw pacman  circle
  stroke(255,255,0);
  fill(255,255,0);
  arc(pacX, pacY, 50, 50, pacAngle, TWO_PI - pacAngle, PIE);
  
  pacAnimation();
  
}

void pacMovement(){
  //controls whether pacman moves left or right
  if(right){
    pacX = (pacX + pacSpeed) % width;
  }
  else if(!right){
    pacX = (pacX - pacSpeed);
   if (pacX < 0) {
      pacX = width;
   }
  }
}


void pacAnimation() {
  // Set the mouth opening and closing speed
  float mouthSpeed = 0.1;
  
  // Update the mouth angle based on time
  pacMouth += mouthSpeed;
  
  // Limit the mouth angle to prevent it from opening too wide
  pacAngle = min(PI/3 * abs(sin(pacMouth)), PI/3);
}



void keyPressed() {
  // Change PacMan's direction when the spacebar is pressed
  if (key == ' ') {
    right = !right;
    // Reset mouth angle
    pacAngle = 0;
  }
}
