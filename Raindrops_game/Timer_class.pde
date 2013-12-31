class Timer {
  Timer() {
  }
  void display() {
    stroke(40, 205, 205);
    textSize(20);
    textAlign(CENTER);
    text("Time: " + millis(), 75, 50); //shows time elapsed since game was opened
    textSize(15); //including time spent on start screen.
    textAlign(CORNER);
    if (millis() >= 150000) {
      text("oh would you look at the time", 25, 75); //clock has an attitude.
    }
    textSize(10);
    textAlign(CORNER);
    if (millis() >= 200000) {
      text("Tick tock goes the clock \n And what now shall we play?", 100, 100);
    }
  }
}
