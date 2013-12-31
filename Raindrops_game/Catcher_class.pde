class Catcher {
  int d, i;
  float ypos;
  PVector loc;
  PImage buck;

  Catcher() {
    loc = new PVector(mouseX, ypos);
    d = 50;
    buck = loadImage("tool-tip-bucket.png"); //look at that shiny lil buckaroo bucket.
  }
  void catcherHeight() { //catcher is high enough initally and then will rise with the water level
    if (puddle >=60) {
      ypos = height-puddle+10;
    }
    else {
      ypos = height - d- 5;
    }
  }
  void display() {
    noStroke();
    noFill(); //so ellipse will catch the drop but image will show in location of
    ellipse(loc.x, loc.y, d, d);
    imageMode(CENTER);
    image(buck, loc.x, loc.y-20, 75, 75); //so drop won't stop before handle
  }
  void update() {
    loc.set(mouseX, ypos); //catcher will keep up with mouse
  }
  void catchDrop(Raindrops drop) {
    stroke(40, 205, 205);
    textSize(20);
    textAlign(CENTER);
    text("Score: " + score, width-75, 50); //score will show
    if (loc.dist(drop.loc) > d/2 + size/2 && drop.loc.y > height-puddle ) {
      puddle+=size/2; //puddle will rise according to the size of the missed raindrop.
    }
  }
}

