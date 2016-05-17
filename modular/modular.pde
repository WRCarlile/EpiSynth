import beads.*;
AudioContext ac;
WavePlayer wp;
Gain g;
Glide freqGlide;
int freq = 200;
 
void setup()
{
  size(400,300);
  
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
    if(key=='a' || key=='A'){
      freqGlide.setValue(262);
    } 
     else if (key=='w' || key=='W'){
      freqGlide.setValue(278);
    } 
     else if (key=='s' || key=='S'){
      freqGlide.setValue(294);
    } 
     else if (key=='e' || key=='E'){
      freqGlide.setValue(311);
    }
    else if (key=='e' || key=='E'){
      freqGlide.setValue(311);
    }
     else if (key=='d' || key=='D'){
      freqGlide.setValue(330);
    }
    else if (key=='f' || key=='F'){
      freqGlide.setValue(349);
    }
    else if (key=='t' || key=='T'){
      freqGlide.setValue(370);
    }
    else if (key=='g' || key=='G'){
      freqGlide.setValue(392);
    }
    else if (key=='y' || key=='Y'){
      freqGlide.setValue(415);
    }
    else if (key=='h' || key=='H'){
      freqGlide.setValue(440);
   }
   else if (key=='u' || key=='U'){
      freqGlide.setValue(466);
   }  
   else if (key=='j' || key=='J'){
      freqGlide.setValue(494);
   }
   else if (key=='k' || key=='K'){
      freqGlide.setValue(523);
   }
   else if (key=='o' || key=='O'){
      freqGlide.setValue(554);
   }
   else if (key=='l' || key=='L'){
      freqGlide.setValue(587);
   }
} 
 
}