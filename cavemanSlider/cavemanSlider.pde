import beads.*;
AudioContext ac;
WavePlayer wp;
Gain g;
Glide freqGlide;
Glide gainGlide;

float bx;
float by;
int boxSize = 50;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0;
float yOffset = 0.0;
//Glide (ac, starting value, glide time)
//Gain (ac, #inputs/outputs, starting value of gain 0.0-1.0)
//WavePlayer (ac, frequency/ug controlling fq, type of signal)

void setup(){
  bx = width/2.0;
  by = height/2.0;
  rectMode(CENTER);

  size(920, 615);
  ac = new AudioContext();

  gainGlide = new Glide(ac, 0.0, 50);
  freqGlide = new Glide(ac, 0.0, 0);

  WavePlayer wp = new WavePlayer(ac, freqGlide, Buffer.SINE);
  g = new Gain(ac, 1, gainGlide);

  g.addInput(wp);
  ac.out.addInput(g);
  ac.start();

//build: object moves, provides new parameter for existing gain, key press responds
}



void draw() {
  background(0);
  if (mouseX > bx-boxSize && mouseX < bx+boxSize &&
    mouseY > by-boxSize && mouseY < by+boxSize)
    {
      overBox = true;
      if(!locked) {

        stroke(255);
        fill(153);

        //Constrain box
        bx = constrain(mouseX, 100, 600);
        by = constrain(mouseY, 100, 100);
      }
      } else {
        stroke(153);
        fill(153);
        overBox = false;
      }

      rect(bx, by, boxSize, boxSize);

  keyPressed(); {
    fill(255);
    if(key=='a' || key=='A'){
      freqGlide.setValue(262);
      fill(204);
    }
    rect(310, 490, 30, 100);

    fill(255);
    if (key=='s' || key=='S'){
      freqGlide.setValue(294);
      fill(204);
    }
    rect(340, 490, 30, 100);

    fill(255);
    if (key=='d' || key=='D'){
      freqGlide.setValue(330);
      fill(204);
    }
    rect(370, 490, 30, 100);

    fill(255);
    if (key=='f' || key=='F'){
      freqGlide.setValue(349);
      fill(204);
    }
    rect(400, 490, 30, 100);

    fill(255);
    if (key=='g' || key=='G'){
      freqGlide.setValue(392);
      fill(204);
    }
    rect(430, 490, 30, 100);

    fill(255);
    if (key=='h' || key=='H'){
      freqGlide.setValue(440);
      fill(204);
    }
    rect(460, 490, 30, 100);

    fill(255);
    if (key=='j' || key=='J'){
      freqGlide.setValue(494);
      fill(204);
    }
    rect(490, 490, 30, 100);

    fill(255);
    if (key=='k' || key=='K'){
      freqGlide.setValue(523);
      fill(204);
    }
    rect(520, 490, 30, 100);

    fill(255);
    if (key=='l' || key=='L'){
      freqGlide.setValue(587);
      fill(204);
    }
    rect(550, 490, 30, 100);

    fill(255);
    if (key==';' || key==':'){
      freqGlide.setValue(659);
      fill(204);
    }
    rect(580, 490, 30, 100);

    fill(0);
    if (key=='w' || key=='W'){
      freqGlide.setValue(278);
      fill(204);
    }
    rect(332, 490, 15, 60);

    fill(0);
    if (key=='e' || key=='E'){
      freqGlide.setValue(311);
      fill(204);
    }
    rect(362, 490, 15, 60);

    fill(0);
    if (key=='t' || key=='T'){
      freqGlide.setValue(370);
      fill(204);
    }
    rect(422, 490, 15, 60);

    fill(0);
    if (key=='y' || key=='Y'){
      freqGlide.setValue(415);
      fill(204);
    }
    rect(452, 490, 15, 60);

    fill(0);
    if (key=='u' || key=='U'){
      freqGlide.setValue(466);
      fill(204);
    }
    rect(482, 490, 15, 60);

    fill(0);
    if (key=='o' || key=='O'){
      freqGlide.setValue(554);
      fill(204);
    }
    rect(542, 490, 15, 60);

    fill(0);
    if (key=='p' || key=='P'){
      freqGlide.setValue(622);
      fill(204);
    }
    rect(572, 490, 15, 60);


  }
}

void mousePressed() {
  if(overBox) {
    locked = true;
    fill(255, 255, 255);

    if ((mouseX/(float)width) > 0)
    {
          gainGlide.setValue(mouseX/(float)width);
    }
      //frequencyGlide.setValue(mouseY);

  } else {
    locked = false;
  }
  xOffset = mouseX-bx;
  yOffset = mouseY-by;

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset;
    by = mouseY-yOffset;

             if ((mouseX/(float)width) > 0 && (mouseX/(float)width) <1)
    {
          gainGlide.setValue(mouseX/(float)width);
    }

  }
}

void mouseReleased() {
  locked = false;

}

// // 0.0 is the initial value contained by the Glide
// // it will take 50ms for it to transition to a new value
// gainGlide = new Glide(ac, 0.0, 50);
// // create frequency glide object
// // give it a starting value of 2 (Hz)
// // and a transition time of 50ms
// freqGlide = new Glide(ac, 2, 50);
// // WavePlayer objects generate a waveform
// WavePlayer wp = new WavePlayer(ac, 440, Buffer.SINE);
// // connect the WavePlayer to the AudioContext
// ac.out.addInput(wp);
// // start audio processing
// ac.start();
// }
//
// freqGlide = new Glide(ac, 0.0, .5);
// WavePlayer wp = new WavePlayer(ac, freqGlide, Buffer.SINE);
//
// g = new Gain(ac, 1, 0.2);
//
// g.addInput(wp);
// ac.out.addInput(g);
// ac.start();
