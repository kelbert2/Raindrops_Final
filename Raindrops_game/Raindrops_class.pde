class Raindrops {
  int index = 1;
  PVector loc, vel, acc;
  int i;
  int trans;

  Raindrops() {
    for ( i = 0; i < amount; i++) {
      loc = new PVector(random(-1*size, width+size), 0);
      vel = new PVector(0, random(.3, 1));
      acc = new PVector(0, .015); 
      size = random(12, 15); //size and speed change.
    }
  }
  void display() {
    noStroke();
    if (size>=14) {
      trans = 225;
    } 
    else if (size<14 && size>=13) {
      trans = 175;
    } 
    else {
      trans = 100;
    }
    fill(100, 200, 250, trans);
    //if get a raindrop image, can change the tint darker with this
    ellipse(loc.x, loc.y, size, size);
  }
  void fall() {
    loc.add(vel);
    vel.add(acc);
  }
  void update() {
    size = random(15, 18);
    // to make not reappear, set v or acc to zero, loc off screen. otherwise will increase in difficulty as miss more.
    //    loc.set(random(-1*size, width+size), -1* size); //problem is that it will return to being slow
    loc.set(width*2, 0);
    vel.set(0, 0);
    acc.set(0, 0);
  }
  void reset() { 
    if (loc.y > height-puddle) { //the water level will rise when raindrops are missed
      update();
      loc.x = random(width);
      loc.y = -2*size;
    }
    if (loc.x > width + size) { 
      loc.x = -2*size;
    }
  }

  void GameOver(Shark sharky, Catcher cat) {
    sharky.display();
    sharky.swim(); //shark will swim by when water level is high enough, and ends the game.
  }
  void check(Catcher cat) {
    if (loc.dist(cat.loc) < size/2 +cat.d/2) {
      update();
      score+=1; //score will increase and raindrop will update when drop is caught in catcher.
    }
  }
}

