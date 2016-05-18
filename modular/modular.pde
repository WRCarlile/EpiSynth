import beads.*;

AudioContext ac;
WavePlayer wp;
WavePlayer modulator;
Gain g; //<>// //<>//
Glide noteFrequency;
Glide modulatorFrequency;
Envelope gainEnvelope;
OnePoleFilter filter1;
boolean keyPress;

void setup()
{
  size(920,615);
  //keyboard is 405px w and 100px h
  keyPress = false;
  ac = new AudioContext();
  gainEnvelope = new Envelope(ac, 0.0);
  noteFrequency = new Glide(ac, 20, 10);
  modulatorFrequency = new Glide(ac, 20, 30);

  modulator = new WavePlayer(ac, modulatorFrequency, Buffer.SAW);
  Function frequencyModulation = new Function(modulator) {
   public float calculate() {
   return (x[0] * 200.0) + (mouseY);
   }
 };

  WavePlayer wp = new WavePlayer(ac, noteFrequency, Buffer.SINE);
  filter1 = new OnePoleFilter(ac, frequencyModulation);

  g = new Gain(ac, 1, gainEnvelope);
  filter1.addInput(wp);

  g.addInput(filter1);
  ac.out.addInput(g);
  ac.start();
  background(#1fa5b1);
//KEYBOARD OUTLINE
  stroke(0);
  rect(310, 490, 30, 100);
  stroke(0);
  rect(340, 490, 30, 100);
  stroke(0);
  rect(370, 490, 30, 100);
  stroke(0);
  rect(400, 490, 30, 100);
  stroke(0);
  rect(430, 490, 30, 100);
  stroke(0);
  rect(460, 490, 30, 100);
  stroke(0);
  rect(490, 490, 30, 100);
  stroke(0);
  rect(520, 490, 30, 100);
  stroke(0);
  rect(550, 490, 30, 100);
  stroke(0);
  rect(580, 490, 30, 100);
  stroke(0);
  rect(332, 490, 15, 60);
  stroke(0);
  rect(362, 490, 15, 60);
  stroke(0);
  rect(422, 490, 15, 60);
  stroke(0);
  rect(452, 490, 15, 60);
  stroke(0);
  rect(482, 490, 15, 60);
  stroke(0);
  rect(542, 490, 15, 60);
  stroke(0);
  rect(572, 490, 15, 60);

}

boolean stop;

void draw() {

 if (stop == false) {
 modulatorFrequency.setValue((mouseX + 100));
 //stroke(0);
 //rect(355, 200, 200, 200);
  float value = random(10,40);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,value,value);
  }
 if (mousePressed && (mouseButton == RIGHT)) {
  background(#317E4D);
 }
}

void mousePressed(){
  if (stop == false) {
    stop = true;
  }else {
    stop = false;
  }
}
void keyPressed() {
  gainEnvelope.addSegment(0.2, 5);
  keyPress = true;
  fill(255);
    if(key=='a' || key=='A'){
      noteFrequency.setValue(262);
      fill(random(255),random(255),random(255));
    }
    rect(310, 490, 30, 100);

   fill(255);
    if (key=='s' || key=='S'){
      noteFrequency.setValue(294);
      fill(random(255),random(255),random(255));
    }
    rect(340, 490, 30, 100);

   fill(255);
    if (key=='d' || key=='D'){
      noteFrequency.setValue(330);
      fill(random(255),random(255),random(255));
    }
    rect(370, 490, 30, 100);

   fill(255);
     if (key=='f' || key=='F'){
      noteFrequency.setValue(349);
      fill(random(255),random(255),random(255));
    }
    rect(400, 490, 30, 100);

   fill(255);
    if (key=='g' || key=='G'){
      noteFrequency.setValue(392);
      fill(random(255),random(255),random(255));
    }
    rect(430, 490, 30, 100);

   fill(255);
     if (key=='h' || key=='H'){
      noteFrequency.setValue(440);
      fill(random(255),random(255),random(255));
    }
    rect(460, 490, 30, 100);

   fill(255);
    if (key=='j' || key=='J'){
      noteFrequency.setValue(494);
      fill(random(255),random(255),random(255));
    }
    rect(490, 490, 30, 100);

  fill(255);
   if (key=='k' || key=='K'){
      noteFrequency.setValue(523);
      fill(random(255),random(255),random(255));
   }
   rect(520, 490, 30, 100);

  fill(255);
   if (key=='l' || key=='L'){
      noteFrequency.setValue(587);
      fill(random(255),random(255),random(255));
   }
   rect(550, 490, 30, 100);

  fill(255);
   if (key==';' || key==':'){
      noteFrequency.setValue(659);
      fill(random(255),random(255),random(255));
   }
   rect(580, 490, 30, 100);

   fill(255);
    if (key=='w' || key=='W'){
      noteFrequency.setValue(278);
      fill(random(255),random(255),random(255));
    }
    rect(332, 490, 15, 60);

   fill(255);
    if (key=='e' || key=='E'){
      noteFrequency.setValue(311);
      fill(random(255),random(255),random(255));
    }
    rect(362, 490, 15, 60);

    fill(255);
     if (key=='t' || key=='T'){
      noteFrequency.setValue(370);
      fill(random(255),random(255),random(255));
    }
    rect(422, 490, 15, 60);

    fill(255);
    if (key=='y' || key=='Y'){
      noteFrequency.setValue(415);
      fill(random(255),random(255),random(255));
   }
   rect(452, 490, 15, 60);

  fill(255);
   if (key=='u' || key=='U'){
      noteFrequency.setValue(466);
      fill(random(255),random(255),random(255));
   }
   rect(482, 490, 15, 60);

  fill(255);
   if (key=='o' || key=='O'){
      noteFrequency.setValue(554);
      fill(random(255),random(255),random(255));
   }
   rect(542, 490, 15, 60);

 fill(255);
   if (key=='p' || key=='P'){
      noteFrequency.setValue(622);
      fill(random(255),random(255),random(255));
   }
   rect(572, 490, 15, 60);

  }

void keyReleased() {
  keyPress= false;
    if(keyPress == false) {
     gainEnvelope.addSegment(0.0, 100);

    }
  }