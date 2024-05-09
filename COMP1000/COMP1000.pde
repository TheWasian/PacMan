//pacman variables
float pacX;
float pacY;
float pacSpeed = 3;
boolean intangible = false;
float intangibleTick = 0;

//animation variables
float pacAngle = 0;
boolean right = true;

//ghost variables
float ghostX = 130;
float ghostY = height/2 + 37;
float ghostWidth = 25;
float ghostHeight = 25;
color ghostColour;
float ghostSpeed = 3.05;
boolean ghostRight = true;
float ghostTick = 0;

//berry variable
float berryX;
float berryY;
float berryDist;


void setup() {
  size(800,200);
  pacY = height/2;
  pacX = width/2;
  
  berryX = random(0,800);
  berryY = height/2;
  

}

void draw(){
  background(0);
  
//Blue tracks
  stroke(0, 0, 255);
  strokeWeight(10);
  line(0, height/2 - 50, width, height/2 - 50);
  line(0, height/2 + 50, width, height/2 + 50);
  stroke(0);
  
//BERRY
  
 fill(255,184,3);
 strokeWeight(0);
 circle(berryX,berryY,10);
 
 berryDist = dist(berryX, berryY, pacX, pacY);
 
 
 if(berryDist < 5){   
   berryX = random(0,800);
   intangible = true;
 }
 
  
  
  
  
  
  
//PACMAN
  
  
//draw pacman  circle
  fill(255,255,0);
  circle(pacX,pacY,25);
  
//controls whether pacman moves left or right and animation of mouth
  fill(0);
  if(right){
    pacX = (pacX + pacSpeed);
    arc(pacX, pacY, 40.1, 40.1, -pacAngle, pacAngle);
    if (pacX > 810){
      pacX = 0;
    }
  }
  
  else if(!right){
    pacX = (pacX - pacSpeed);
    arc(pacX, pacY, 40.1, 40.1, PI - pacAngle, PI +pacAngle);
   if (pacX < -10) {
      pacX = width;
   }
  }
//resets pacAngle
    pacAngle += 0.035;
  if(pacAngle >= THIRD_PI){
    pacAngle = 0;
  }
    
//TICK
  if(intangible == true){
  intangibleTick++;
    if(intangibleTick > 110){
      intangibleTick = 0;
      intangible = false;
      }
  }
  
  
  
  
//GHOST

  //ghost colour
  if(intangible == true){
    ghostColour = color(255);
  }
  else if(intangible == false){
    ghostColour = color(255,0,0);
  }
  
  //determine ghost direction
  ghostTick++;
  if(ghostTick > random(150,220)){
    ghostTick = 0;
    ghostRight = !ghostRight;
  }
  
  
  
  //draw ghost
  fill(ghostColour);
  rect(ghostX, ghostY, ghostWidth, ghostHeight);
  if(ghostRight == true){
    ghostX = (ghostX + ghostSpeed);
    if (ghostX > 810){
      ghostX = 0;
    }
  }
  else if(ghostRight == false){
    ghostX = (ghostX - ghostSpeed);
    if (ghostX < -10) {
      ghostX = width;
   }
  }
 } 
  
   


  
void keyPressed() {
// Change PacMan's direction when the spacebar is pressed
  if (key == ' ') {
    right = !right;   
    }
}
