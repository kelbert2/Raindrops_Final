Timer time;
StartScreen ss;
Catcher bucket;
Shark fish;
Winner winning;
int amount = 200; //for Raindrops
int index = 1;
int timeChange, currentTime, oldTime;
boolean run;
float puddle;
Raindrops[] drop = new Raindrops[amount];
int score;
float size;
void setup() {
  size(500, 500);
  for   ( int i = 0; i < amount; i++) {
    drop[i] = new Raindrops();
  }
  bucket = new Catcher();
  fish = new Shark(); //to swim by in the rising water as droplets miss when Game Over
  time = new Timer();
  ss = new StartScreen();
  run = false;
  puddle = 0;
  winning = new Winner();
  score =0;
}
void draw() {
  if (run == true) { //when keyPressed, game may begin.
    background(170, 230, 245);

    currentTime =millis();
    timeChange = currentTime - oldTime;
    if (timeChange >= 1000) {
      oldTime = currentTime; //Drops fall according to interval.
      if (index < drop.length) {
        index++;
      }
    }
    for (int i = 0; i < index; i++) { //drops fall one by one.
      drop[i].fall();
      drop[i].display();
      drop[i].check(bucket);
      bucket.catchDrop(drop[i]);
      bucket.catcherHeight();
      drop[i].reset();
    }
    bucket.display(); //All this shows up.
    bucket.update(); //Catcher will keep up with mouse because void draw loops.
    time.display();

    if (puddle >= 200) {
      for (int i = 0; i < index; i++) {
        drop[i].GameOver(fish, bucket);
      }
      bucket.update();
    }
    if (score>= 25) {
      winning.display(); //a score of 25 will win the game.
    }
    noStroke();
    fill(100, 200, 250, 100); //bucket and shark will show through the water.
    rect(0, height-puddle, width, puddle); 
    rect(0, height-puddle+8, width, puddle); //now we have the three beautiful water levels
    rect(0, height-puddle+18, width, puddle); //originally, each drop would create a new rectangle, and I liked the look of that.
    if (puddle >= height) {
      puddle = 200; //puddle height will stay high enough to display shark, but will not rise so much that it takes over the screen forever.
    }
  } 
  else {
    ss.display(); //shows start screen, as seen under its class until keyPressed (see below)
  }
}
void keyPressed() { //Takes back to or lets leave Start Screen.
  run = !run;
  if (run) { //reinitializes everything like under setup()
    for   ( int i = 0; i < amount; i++) {
      drop[i] = new Raindrops();
    }
    bucket = new Catcher();
    fish = new Shark(); //to swim by in the rising water as droplets miss when Game Over
    time = new Timer();
    ss = new StartScreen();
    puddle = 0; //water level and score reset to 0; game starts over
    score = 0;
  }
}

