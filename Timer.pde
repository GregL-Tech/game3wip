public class Timer {
  long tickTime;
  long secondsTime;
  long endTime;
  double end;
  int seconds = 1000;
  int tick = 500;
  int timeLeft;
  boolean timerEnd = false;
  boolean timerStart = true;

  void startTimer(double miniTimerConst, double miniTimerMult) {

    if (timerStart) {
      end = miniTimerConst / miniTimerMult; //Apply Time Left Multiplier
      timeLeft = (int) Math.round(end/1000); //Set time to Seconds instead of Milliseconds
      tickTime = millis();
      secondsTime = millis();
      endTime = millis();
      println(timeLeft);
      timerStart = false;
    } //Starts Timers

    if (millis() - secondsTime >= seconds && !timerEnd) {
      timeLeft--;
      println(timeLeft); //Bomb Display
      secondsTime = millis(); //Reset Every Second
    }

    if (millis() - tickTime >= tick && !timerEnd) {
      println("tick"); //Fuse Tick
      tickTime = millis();
    }

    if (millis() - endTime >= end && !timerEnd) {
      println("Time's Up!"); //Bomb Explodes
      timerEnd = true;
    }
  }
}
