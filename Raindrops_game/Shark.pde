class Shark {
  color water, eyecolor, skin;
  int scale, bigx, bigy;
  PVector loc;
  Shark() {
    water = color(170, 230, 245); //should match background color
    // other color option 100, 200, 255
    eyecolor = color(255, 100, 100);
    skin = color(150);
    //need to make
    loc =new PVector(0, 0); 
    scale=1;
    bigx=-101*scale; //original location
    bigy=425*scale;
  }
  void display() {

    int chinx = 90*scale;
    int chiny = 75*scale;
    int finy = bigy-36*scale;
    int finx = bigx-20*scale;
    int tailx = bigx-135*scale;
    int taily = bigy+5*scale;
    int fin1x = bigx-20*scale;
    int fin1y = bigy+35*scale;
    int mouthx=bigx+35*scale;
    int mouthy=bigy;
    stroke(100);
    strokeWeight(2);
    beginShape();
    //body and tail
    smooth();
    fill(skin);
    arc(bigx, bigy, 200*scale, chiny, THIRD_PI, TWO_PI);
    ellipse(tailx, taily, 90*scale, 90*scale);
    noStroke();
    fill(water); //so I don't have to deal with more bezierVerteces
    ellipse(tailx-30*scale, taily+8, 90*scale, 80*scale);
    fill(skin);
    stroke(100);
    //dorsal fin
    beginShape();
    vertex(finx, finy);
    bezierVertex(finx*3/4, finy+10*scale, finx-10*scale, finy-5*scale, finx-50*scale, finy-50*scale);
    bezierVertex(finx+25*scale, finy-50*scale, finx+50*scale, finy, finx+50*scale, finy);
    endShape(); //this stretches when shark swims right. I won't try to mess with this anymore because bexier curves are already complicated.
    //fin
    beginShape();
    arc(fin1x, fin1y, 80*scale, 40*scale, -1*QUARTER_PI, HALF_PI+THIRD_PI/2, CHORD);
    endShape();
    beginShape();
    line(bigx+35*scale, bigy, bigx+100*scale, bigy);
    //jaw and teeth
    beginShape();
    arc(mouthx, mouthy, chinx, chiny, 0, PI);
    fill(255);
    triangle(bigx+35*scale, bigy, bigx+45*scale, bigy, bigx+40*scale, bigy-10*scale);
    triangle(bigx+45*scale, bigy, bigx+55*scale, bigy, bigx+50*scale, bigy-10*scale);
    line(mouthx, mouthy, mouthx+chinx/2, mouthy);
    endShape();
    //eyes
    fill(eyecolor);
    ellipse(bigx+15*scale, bigy-15*scale, 8*scale, 10*scale);
    endShape();
  }
  void swim() {
    bigx++; //will swim right.
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(25);
    text("press any key to return", width/2, height/2 +50);
    if (bigx> width+101) {
      bigx=-101*scale; //appears back to swimming.
    }
  }
}

