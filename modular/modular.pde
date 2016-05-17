import beads.*;
AudioContext ac;
WavePlayer wp;
Gain g;
Glide freqGlide; //<>//
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
freqGlide = new Glide(ac, 20, 0);
WavePlayer wp = new WavePlayer(ac, freqGlide, Buffer.SINE);
filter1 = new OnePoleFilter(ac, 200.0);
filter1.addInput(wp);

g = new Gain(ac, 1, gainEnvelope);

g.addInput(filter1);
ac.out.addInput(g);
ac.start();
}

void draw() {



  
}

void keyPressed() {
  
   keyPress = true;
   fill(255);
    if(key=='a' || key=='A'){
      freqGlide.setValue(262);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(310, 490, 30, 100);

   fill(255);
    if (key=='s' || key=='S'){
      freqGlide.setValue(294);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(340, 490, 30, 100);

   fill(255);
    if (key=='d' || key=='D'){
      freqGlide.setValue(330);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(370, 490, 30, 100);

   fill(255);
     if (key=='f' || key=='F'){
      freqGlide.setValue(349);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(400, 490, 30, 100);

   fill(255);
    if (key=='g' || key=='G'){
      freqGlide.setValue(392);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(430, 490, 30, 100);

   fill(255);
     if (key=='h' || key=='H'){
      freqGlide.setValue(440);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(460, 490, 30, 100);

   fill(255);
    if (key=='j' || key=='J'){
      freqGlide.setValue(494);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(490, 490, 30, 100);

  fill(255);
   if (key=='k' || key=='K'){
      freqGlide.setValue(523);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(520, 490, 30, 100);

  fill(255);
   if (key=='l' || key=='L'){
      freqGlide.setValue(587);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(550, 490, 30, 100);

  fill(255);
   if (key==';' || key==':'){
      freqGlide.setValue(659);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(580, 490, 30, 100);

   fill(255);
    if (key=='w' || key=='W'){
      freqGlide.setValue(278);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(332, 490, 15, 60);

   fill(255);
    if (key=='e' || key=='E'){
      freqGlide.setValue(311);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(362, 490, 15, 60);

    fill(255);
     if (key=='t' || key=='T'){
      freqGlide.setValue(370);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(422, 490, 15, 60);

    fill(255);
    if (key=='y' || key=='Y'){
      freqGlide.setValue(415);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(452, 490, 15, 60);

  fill(255);
   if (key=='u' || key=='U'){
      freqGlide.setValue(466);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(482, 490, 15, 60);

  fill(255);
   if (key=='o' || key=='O'){
      freqGlide.setValue(554);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(542, 490, 15, 60);

 fill(255);
   if (key=='p' || key=='P'){
      freqGlide.setValue(622);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(572, 490, 15, 60);

  } 

void keyReleased() {
  keyPress= false;
    if(keyPress == false) {
     gainEnvelope.addSegment(0.0, 100);
     fill(0);  
    }
  }