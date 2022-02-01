import processing.sound.*;
SoundFile WOW;
SoundFile Omae;
Food[] foods;
Enemy enemy;
float xpos=width/2;
float ypos=height/2;
float radius=50;
int leave = 0;
float x;
float y;
float vx;
float vy;
boolean Game_over=false;
void setup() {
  fullScreen();
  foods = new Food[150];
  enemy = new Enemy();
  for (int i=0; i<foods.length; i=i+1)
  {
    foods[i] = new Food(random(0, width), random(0, height));
  }

  WOW = new SoundFile(this, "WOW Anime.mp3");
  Omae =new SoundFile(this, "omae_nani.mp3");
  frameRate(9000);
  shapeMode(CENTER);
  vx = 1;
  vy =1;
}


void draw() {
  background(#E8B4E8);
  noStroke();
  fill(#0A03FC);
  circle(mouseX, mouseY, radius);
  for (int i=0; i<foods.length; i=i+1)
  {
    foods[i].draw();
    foods[i].move();
  }
  enemy.draw();
  if (radius>=500) {
    Game_win();
   }
   if (enemy.collide(mouseX, mouseY)) {
    Game_lose();
   } 
}
void mouseMoved() {
  for (Food food : foods) {
    if (food.collide(mouseX, mouseY)) {
      food.is_eaten=true;
      radius=radius+0.25;
      //fill(#0A03FC);
      //circle(mouseX, mouseY, radius) ;
    }
  } //println(enemy.collide(mouseX, mouseY));
  //if (enemy.collide(mouseX, mouseY)) {
  //  Game_lose();
     
}


void Game_win() {
  //if (radius>=500) {
    background(0);
    fill(255);
    textSize(350);
    textAlign(CENTER);
    text("WOW!!!!", width/2, height/2);
    WOW.play();
    //WOW = new SoundFile(this, "WOW Anime.mp3");
    noLoop();
  //}
}

void Game_lose() {
  //if (radius>=500) {
    background(255);
    fill(0);
    textSize(350);
    textAlign(CENTER);
    text("NANI!!!!", width/2, height/2);
    Omae.play();
    //omae = new SoundFile(this, "omae_nani.mp3");
    noLoop();
  //}

}




void keyPressed() {
  if (key=='q') {
    System.exit(leave);
  }
}
