class Winner {
  String p= "press any key twice to restart   press any key twice to restart   press any key twice to restart   ";
  String w1= " The drops of rain make a hole in the stone, \n not by violence, \n but by oft falling. \n - Lucretius";
  String w2= "you caught it like the plague";
  String w3= "hope you didn't schedule a parade";
  String w4= "drop it like it's wet";
  String w5= "drip drippity";
  String w6= "rain rain come to stay";
  String w7= "we all fall down";
  String w8= "i love how the rain can hide my tears";
  int l = 0;
  Winner() {
  }
  void display() {
    background(100, 100, 250);
    textAlign(CENTER);
    textSize(18);
    fill(random(200), random(50), random(100));
    text(w1, width/2 + random(-1, 1), height/2+random(-1, 1)); //motion and slight color change/flash add interest in an otherwise boring world.
    fill(random(150), random(100), random(100));
    text(w2, width*5/8+random(-1, 1), height*13/16+random(-1, 1));
    fill(random(50), random(150), random(150));
    text(w3, width*5/8+random(-1, 1), height*3/16+random(-1, 1));
    fill(random(150), random(150), random(150));
    text(w4, width*13/16+random(-1, 1), height*3/8+random(-1, 1));
    fill(random(50), random(255), random(50));
    text(w5, width/8+random(-1, 1), height/8+random(-1, 1)); //staggered heights and widths because the universe is moving ever closer and closer to entropy and chaos so why not let disorder win here.
    fill(random(50), random(50), random(255));
    text(w6, width/4+random(-1, 1), height/4+random(-1, 1));
    fill(random(100), random(255), random(100));
    text(w7, width/3+random(-1, 1), height*3/4+random(-1, 1));
    fill(random(100), random(100), random(255));
    text(w8, width/3+random(-1, 1), height*14/15+random(-1, 1)); //it's like a party FOR WINNERS
    textAlign(CORNER);
    fill(255, 150, 200);
    textSize(30);
    text(p, l, height-50);
    l--;
    if (l<=-450) {
      l=10; //text rolls across bottom of the screen; mostly smooth
    }
    puddle = 40;  //still there, but not rising with unseen raindrops. Should bring back nostalgia for good games past.
  }
}

