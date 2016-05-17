import beads.*;
AudioContext ac;
WavePlayer wp;
Gain g;
Glide freqGlide; //<>//

void setup()
{
  size(920,615);
//keyboard is 405px w and 100px h

ac = new AudioContext();

freqGlide = new Glide(ac, 0.0, 0);
WavePlayer wp = new WavePlayer(ac, freqGlide, Buffer.SINE);

g = new Gain(ac, 1, 0.2);

g.addInput(wp);
ac.out.addInput(g);
 ac.start();
}

void draw() {
 keyPressed(); {
   fill(255);
    if(key=='a' || key=='A'){
      freqGlide.setValue(262);
      fill(random(255),random(255),random(255));
    }
    rect(310, 490, 30, 100);

   fill(255);
    if (key=='s' || key=='S'){
      freqGlide.setValue(294);
      fill(random(255),random(255),random(255));
    }
    rect(340, 490, 30, 100);

   fill(255);
    if (key=='d' || key=='D'){
      freqGlide.setValue(330);
      fill(random(255),random(255),random(255));
    }
    rect(370, 490, 30, 100);

   fill(255);
     if (key=='f' || key=='F'){
      freqGlide.setValue(349);
      fill(random(255),random(255),random(255));
    }
    rect(400, 490, 30, 100);

   fill(255);
    if (key=='g' || key=='G'){
      freqGlide.setValue(392);
      fill(random(255),random(255),random(255));
    }
    rect(430, 490, 30, 100);

   fill(255);
     if (key=='h' || key=='H'){
      freqGlide.setValue(440);
      fill(random(255),random(255),random(255));
    }
    rect(460, 490, 30, 100);

   fill(255);
    if (key=='j' || key=='J'){
      freqGlide.setValue(494);
      fill(random(255),random(255),random(255));
    }
    rect(490, 490, 30, 100);

  fill(255);
   if (key=='k' || key=='K'){
      freqGlide.setValue(523);
      fill(random(255),random(255),random(255));
   }
   rect(520, 490, 30, 100);

  fill(255);
   if (key=='l' || key=='L'){
      freqGlide.setValue(587);
      fill(random(255),random(255),random(255));
   }
   rect(550, 490, 30, 100);

  fill(255);
   if (key==';' || key==':'){
      freqGlide.setValue(659);
      fill(random(255),random(255),random(255));
   }
   rect(580, 490, 30, 100);

   fill(255);
    if (key=='w' || key=='W'){
      freqGlide.setValue(278);
      fill(random(255),random(255),random(255));
    }
    rect(332, 490, 15, 60);

   fill(255);
    if (key=='e' || key=='E'){
      freqGlide.setValue(311);
      fill(random(255),random(255),random(255));
    }
    rect(362, 490, 15, 60);

    fill(255);
     if (key=='t' || key=='T'){
      freqGlide.setValue(370);
      fill(random(255),random(255),random(255));
    }
    rect(422, 490, 15, 60);

    fill(255);
    if (key=='y' || key=='Y'){
      freqGlide.setValue(415);
      fill(random(255),random(255),random(255));
   }
   rect(452, 490, 15, 60);

  fill(255);
   if (key=='u' || key=='U'){
      freqGlide.setValue(466);
      fill(random(255),random(255),random(255));
   }
   rect(482, 490, 15, 60);

  fill(255);
   if (key=='o' || key=='O'){
      freqGlide.setValue(554);
      fill(random(255),random(255),random(255));
   }
   rect(542, 490, 15, 60);

 fill(255);
   if (key=='p' || key=='P'){
      freqGlide.setValue(622);
      fill(random(255),random(255),random(255));
   }
   rect(572, 490, 15, 60);

  }

}