class Enemy { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
  float xPos;
  float yPos;
  float vx;
  float vy;
  float diameter=100;
  Enemy() {
    vx =5;
    vy =5;
    xPos =150;
    yPos= 250;
  }
  void setup() {
    frameRate(60);
  }
  void draw() {
    //println(xPos, yPos, vx, vy);
    fill(#00FFFD);
    shapeMode(CENTER);
    ellipse(xPos, yPos, 100, 150);
    xPos=xPos+vx;
    yPos=yPos+vy;

    if ((xPos+50>=width) || (xPos-50<=0)) {
      vx=-vx;
    }
    if ((yPos+75>=height) || (yPos-75<=0)) {
      vy=-vy;
    }
  }

  boolean collide(float inX, float inY) {
    //float diameter=100;
    return dist(inX, inY, xPos, yPos)<=diameter;
  }
}
