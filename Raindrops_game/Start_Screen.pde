class StartScreen {
  int trans, r, i;
  PVector loc[] = new PVector[5];
  StartScreen() {
    trans = 100;
    r = 1;
    for (i = 0; i < 5; i++) {
      loc[i] = new PVector(mouseX, mouseY);
    }
  }
  void display() { //ellipses form where mouse was then fade, like very simple ripples.
    for (i = 0; i < 5; i++) {
      strokeWeight(30);
      noStroke();
      stroke(14, 25, 85, trans);
      noFill();
      ellipseMode(CENTER);
      ellipse(loc[i].x, loc[i].y, r, r);
      r++;
      if (trans > 0) { 
        trans--;
      }
      if (trans == 75) {
        trans = 100;
        loc[i] = new PVector(pmouseX, pmouseY);
      }
      if (r>=75) {
        r=1;
      }
    }
    noStroke();
    fill(0, 0, 255, 10); //transparent so the ellipses fade after creation.
    rect(0, 0, width, height);
    stroke(40, 205, 205); //because having it be so close to the background color makes it look cool because the best way to see it is to make ripples over it.
    textSize(20);
    textAlign(CENTER);
    text("press any key to start", width/2, height/2); //because some people won't do things unless they're told to.
    textSize(10);
    text("what are you doing here? just play the game", width/4, height/8); //because some people want to push the boundaries and explore
    text("there's nothing to see here, \nunless you believe that there is", width*3/4, height/8);
    text("the second round is really a lightning bonus round", width/2, height*3/4); //these people should be rewarded
    text(" Q: What's worse than raining buckets? \n A: Hailing taxis!", width*3/4, height*7/8); //this is quality PLUS it's relevant.
  }
}

