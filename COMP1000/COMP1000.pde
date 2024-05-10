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
float ghostDist = 0;

//berry variable
float berryX;
float berryY;
float berryDist;

//game variables
boolean gameover = false;
int score = 0;

//pellets
int numPellets = 26;
float pelletSize = 5;
float pelletSpacing;
float[][] pellets = new float[26][2];
boolean[] pelletEaten = new boolean[26];
int pelletCounter = 26;

void setup() {  
  size(800, 200);
  pacY = height / 2;
  pacX = width / 2;
  
  berryX = random(0, 800);
  berryY = height / 2;
  
  ghostX = random(0, 800);
  
  pelletSpacing = width / numPellets;
  
  //initalises Pellet locattions
  for (int i = 0; i < pellets.length; i++) {
    pellets[i][0] = (i + 0.5) * pelletSpacing;
    pellets[i][1] = height / 2;
    pelletEaten[i] = false;
  }
}

void draw() {
  background(0);
  fill(255);
  //score text
  textSize(15);
  text(score, 7, 20);
  float delay = random(200, 1000);
  
  //Blue tracks
  stroke(0, 0, 255);
  strokeWeight(10);
  line(0, height / 2 - 50, width, height / 2 - 50);
  line(0, height / 2 + 50, width, height / 2 + 50);
  stroke(0);
  
  //PELLETS
  boolean allPelletsEaten = true; // Flag to check if all pellets are eaten
  for (int i = 0; i < pellets.length; i++) {
    if (!pelletEaten[i]) {
      allPelletsEaten = false; // If there's at least one pellet not eaten, set the flag to false
      fill(255);
      circle(pellets[i][0], pellets[i][1], pelletSize);
      if (dist(pellets[i][0], pellets[i][1], pacX, pacY) < pelletSize / 2) {
        pelletEaten[i] = true;
        score += 5;
        pelletCounter++;
      }
    }
  }
  
  // Respawn pellets if all are eaten
  if (allPelletsEaten) {
    for (int i = 0; i < pellets.length; i++) {
      pelletEaten[i] = false;
    }
  }
 
  //BERRY
  fill(255, 184, 3);
  strokeWeight(0);
  circle(berryX, berryY, 10);
 
  berryDist = dist(berryX, berryY, pacX, pacY);
 
  if (berryDist < 5) {   
    berryX = random(0, 800);
    score += 10;
    intangible = true;
    println("hit");
  }
 
  //PACMAN
  fill(255, 255, 0);
  circle(pacX, pacY, 25);
  
  //controls whether pacman moves left or right and animation of mouth
  fill(0);
  if (right) {
    pacX = (pacX + pacSpeed);
    arc(pacX, pacY, 40.1, 40.1, -pacAngle, pacAngle);
    if (pacX > 810) {
      pacX = 0;
    }
  } else {
    pacX = (pacX - pacSpeed);
    arc(pacX, pacY, 40.1, 40.1, PI - pacAngle, PI + pacAngle);
    if (pacX < -10) {
      pacX = width;
    }
  }
  
  //resets pacAngle
  pacAngle += 0.035;
  if (pacAngle >= THIRD_PI) {
    pacAngle = 0;
  }
    
  //TICK
  if (intangible == true) {
    intangibleTick++;
    if (intangibleTick > 110) {
      intangibleTick = 0;
      intangible = false;
    }
  }
  
  //GHOST
  if (intangible == true) {
    ghostColour = color(255);
  } else if (intangible == false) {
    ghostColour = color(255, 0, 0);
  }
  
  //determine ghost direction
  ghostTick++;
  if (ghostTick > delay) {
    println("GhostTick: ");
    println(ghostTick);
    println("Delay: ");
    println(delay);
    delay = random(200, 1000);
    ghostTick = 0;
    ghostRight = !ghostRight;
  }
  
  //draw ghost
  fill(ghostColour);
  rect(ghostX, ghostY, ghostWidth, ghostHeight);
  if (ghostRight == true) {
    ghostX = (ghostX + ghostSpeed);
    if (ghostX > 810) {
      ghostX = 0;
    }
  } else if (ghostRight == false) {
    ghostX = (ghostX - ghostSpeed); 
    if (ghostX < -10) {
      ghostX = width;
    }
  }
 
  //GAMEOVER
  ghostDist = dist(pacX, pacY, ghostX, ghostY);
  if (ghostDist < 15 && intangible == false) {
    fill(174, 173, 175);
    textSize(25);
    text("GAMEOVER", width/2 - 25, height/2 + 25);
    noLoop();
  }
}

void keyPressed() {
  // Change PacMan's direction when the spacebar is pressed
  if (key == ' ') {
    right = !right;   
  }
}
