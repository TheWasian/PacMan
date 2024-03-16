float pacX;
float pacY;
float pacAngle = 0;


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
  //calls on draw packman function
  drawPac();
  
}

void drawPac(){
  //draw pacman  circle
  strokeWeight(10);
  stroke(255,255,0);
  arc(pacX, pacY, 50, 50, pacAngle, TWO_PI - pacAngle, PIE);
  
  
}

void movementPac(){

}
