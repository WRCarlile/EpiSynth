import beads.*;
AudioContext ac;
WavePlayer wp;
WavePlayer wpa;
WavePlayer wps;
WavePlayer wpd;
WavePlayer wpf;
WavePlayer wpg;
WavePlayer wph;
WavePlayer wpj;
WavePlayer wpk;
WavePlayer wpl;
WavePlayer wpsemicolon;
WavePlayer wpw;
WavePlayer wpe;
WavePlayer wpt;
WavePlayer wpy;
WavePlayer wpu;
WavePlayer wpo;
WavePlayer wpp;
Gain g;
Gain ga;
Gain gs;
Gain gd;
Gain gf;
Gain gg;
Gain gh;
Gain gj;
Gain gk;
Gain gl;
Gain gsemicolon;
Gain gw;
Gain ge;
Gain gt;
Gain gy;
Gain gu;
Gain go;
Gain gp;

Glide freqGlide; //<>//
Envelope gainEnvelope;
OnePoleFilter filter1;
boolean keyPress;
//boolean keyz[] = new boolean [17];

void setup(){

  size(920,615);
//keyboard is 405px w and 100px h
keyPress = false;
ac = new AudioContext();

gainEnvelope = new Envelope(ac, 0.0);
freqGlide = new Glide(ac, 20, 0);
WavePlayer wp = new WavePlayer(ac, freqGlide, Buffer.SINE);
filter1 = new OnePoleFilter(ac, 200.0);
filter1.addInput(wp);

g = new Gain(ac, 17, gainEnvelope);

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
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpa = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      ga = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(262);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(310, 490, 30, 100);
}
   fill(255);
    if (key=='s' || key=='S'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wps = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      gs = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(294);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(340, 490, 30, 100);
}
   fill(255);
    if (key=='d' || key=='D'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpd = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      gd = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(330);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(370, 490, 30, 100);
}
   fill(255);
     if (key=='f' || key=='F'){
       ac = new AudioContext();

       gainEnvelope = new Envelope(ac, 0.0);
       freqGlide = new Glide(ac, 20, 0);
       WavePlayer wpf = new WavePlayer(ac, freqGlide, Buffer.SINE);
       filter1 = new OnePoleFilter(ac, 200.0);
       filter1.addInput(wp);

       gf = new Gain(ac, 1, gainEnvelope);

       g.addInput(filter1);
       ac.out.addInput(g);
       ac.start();{
      freqGlide.setValue(349);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(400, 490, 30, 100);
}
   fill(255);
    if (key=='g' || key=='G'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpg = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      gg = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(392);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(430, 490, 30, 100);
}
   fill(255);
     if (key=='h' || key=='H'){
       ac = new AudioContext();

       gainEnvelope = new Envelope(ac, 0.0);
       freqGlide = new Glide(ac, 20, 0);
       WavePlayer wph = new WavePlayer(ac, freqGlide, Buffer.SINE);
       filter1 = new OnePoleFilter(ac, 200.0);
       filter1.addInput(wp);

       gh = new Gain(ac, 1, gainEnvelope);

       g.addInput(filter1);
       ac.out.addInput(g);
       ac.start();{
      freqGlide.setValue(440);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(460, 490, 30, 100);
}
   fill(255);
    if (key=='j' || key=='J'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpj = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      gj = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(494);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(490, 490, 30, 100);
}
  fill(255);
   if (key=='k' || key=='K'){
     ac = new AudioContext();

     gainEnvelope = new Envelope(ac, 0.0);
     freqGlide = new Glide(ac, 20, 0);
     WavePlayer wpk = new WavePlayer(ac, freqGlide, Buffer.SINE);
     filter1 = new OnePoleFilter(ac, 200.0);
     filter1.addInput(wp);

     gk = new Gain(ac, 1, gainEnvelope);

     g.addInput(filter1);
     ac.out.addInput(g);
     ac.start();{
      freqGlide.setValue(523);
       gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(520, 490, 30, 100);
}
  fill(255);
   if (key=='l' || key=='L'){
     ac = new AudioContext();

     gainEnvelope = new Envelope(ac, 0.0);
     freqGlide = new Glide(ac, 20, 0);
     WavePlayer wpl = new WavePlayer(ac, freqGlide, Buffer.SINE);
     filter1 = new OnePoleFilter(ac, 200.0);
     filter1.addInput(wp);

     gl = new Gain(ac, 1, gainEnvelope);

     g.addInput(filter1);
     ac.out.addInput(g);
     ac.start();{
      freqGlide.setValue(587);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(550, 490, 30, 100);
}
  fill(255);
   if (key==';' || key==':'){
     ac = new AudioContext();

     gainEnvelope = new Envelope(ac, 0.0);
     freqGlide = new Glide(ac, 20, 0);
     WavePlayer wpsemicolon = new WavePlayer(ac, freqGlide, Buffer.SINE);
     filter1 = new OnePoleFilter(ac, 200.0);
     filter1.addInput(wp);

     gsemicolon = new Gain(ac, 1, gainEnvelope);

     g.addInput(filter1);
     ac.out.addInput(g);
     ac.start();{
      freqGlide.setValue(659);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(580, 490, 30, 100);
}
   fill(255);
    if (key=='w' || key=='W'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpw = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      gw = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(278);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(332, 490, 15, 60);
}
   fill(255);
    if (key=='e' || key=='E'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpe = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      ge = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(311);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(362, 490, 15, 60);
}
    fill(255);
     if (key=='t' || key=='T'){
       ac = new AudioContext();

       gainEnvelope = new Envelope(ac, 0.0);
       freqGlide = new Glide(ac, 20, 0);
       WavePlayer wpt = new WavePlayer(ac, freqGlide, Buffer.SINE);
       filter1 = new OnePoleFilter(ac, 200.0);
       filter1.addInput(wp);

       gt = new Gain(ac, 1, gainEnvelope);

       g.addInput(filter1);
       ac.out.addInput(g);
       ac.start();{
      freqGlide.setValue(370);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
    }
    rect(422, 490, 15, 60);
}
    fill(255);
    if (key=='y' || key=='Y'){
      ac = new AudioContext();

      gainEnvelope = new Envelope(ac, 0.0);
      freqGlide = new Glide(ac, 20, 0);
      WavePlayer wpy = new WavePlayer(ac, freqGlide, Buffer.SINE);
      filter1 = new OnePoleFilter(ac, 200.0);
      filter1.addInput(wp);

      gy = new Gain(ac, 1, gainEnvelope);

      g.addInput(filter1);
      ac.out.addInput(g);
      ac.start();{
      freqGlide.setValue(415);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(452, 490, 15, 60);
}
  fill(255);
   if (key=='u' || key=='U'){
     ac = new AudioContext();

     gainEnvelope = new Envelope(ac, 0.0);
     freqGlide = new Glide(ac, 20, 0);
     WavePlayer wpu = new WavePlayer(ac, freqGlide, Buffer.SINE);
     filter1 = new OnePoleFilter(ac, 200.0);
     filter1.addInput(wp);

     gu = new Gain(ac, 1, gainEnvelope);

     g.addInput(filter1);
     ac.out.addInput(g);
     ac.start();{
      freqGlide.setValue(466);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(482, 490, 15, 60);
}
  fill(255);
   if (key=='o' || key=='O'){
     ac = new AudioContext();

     gainEnvelope = new Envelope(ac, 0.0);
     freqGlide = new Glide(ac, 20, 0);
     WavePlayer wpo = new WavePlayer(ac, freqGlide, Buffer.SINE);
     filter1 = new OnePoleFilter(ac, 200.0);
     filter1.addInput(wp);

     go = new Gain(ac, 1, gainEnvelope);

     g.addInput(filter1);
     ac.out.addInput(g);
     ac.start();{
      freqGlide.setValue(554);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(542, 490, 15, 60);
}
 fill(255);
   if (key=='p' || key=='P'){
     ac = new AudioContext();

     gainEnvelope = new Envelope(ac, 0.0);
     freqGlide = new Glide(ac, 20, 0);
     WavePlayer wpp = new WavePlayer(ac, freqGlide, Buffer.SINE);
     filter1 = new OnePoleFilter(ac, 200.0);
     filter1.addInput(wp);

     gp = new Gain(ac, 1, gainEnvelope);

     g.addInput(filter1);
     ac.out.addInput(g);
     ac.start();{
      freqGlide.setValue(622);
      gainEnvelope.addSegment(0.8, 5);
      fill(random(255),random(255),random(255));
   }
   rect(572, 490, 15, 60);
  }
}


void keyReleased() {
  keyPress= false;
    if(keyPress == false) {
     gainEnvelope.addSegment(0.0, 100);
     fill(0);
    }
  }
