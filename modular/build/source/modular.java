import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import beads.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class modular extends PApplet {



AudioContext ac;
WavePlayer wp;
WavePlayer modulator;
Gain g;
Glide noteFrequency;
Glide modulatorFrequency;
Envelope gainEnvelope;
OnePoleFilter filter1;

float[] tones = {262,294,330,349,392,440,494,523,587,659,278,311,370,415,466,554,622};
char keysCapital[] = {'A','S','D','F','G','H','J','K',';','W','E','T','Y','U','O','P'};
char keysLowerCase[] =    {'a','s','d','f','g','h','j','k',';','w','e','t','y','u','o','p'};
String notes[] = {"C","D","E","F","G","A","B","C","D","E","CsDf","DsEf","FsGf","GsAf","AsBf","CsDf","DsEf"};
boolean keyStates[];
int keysPressed = 0;

public void setup()
{
  
  keyStates = new boolean[keysLowerCase.length];
  // keyPress = false;
  ac = new AudioContext();

  gainEnvelope = new Envelope(ac, 0.0f);
  noteFrequency = new Glide(ac, 20, 10);
  modulatorFrequency = new Glide(ac, 20, 30);
  modulator = new WavePlayer(ac, modulatorFrequency, Buffer.SAW);
  Function frequencyModulation = new Function(modulator) {
   public float calculate() {
   return (x[0] * 500.0f) + mouseY;
   }
 };

  WavePlayer wp = new WavePlayer(ac, noteFrequency, Buffer.SINE);
  filter1 = new OnePoleFilter(ac, frequencyModulation);

  g = new Gain(ac, 1, gainEnvelope);
  filter1.addInput(wp);

  g.addInput(filter1);
  ac.out.addInput(g);
  ac.start();

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

public void draw() {
 modulatorFrequency.setValue(mouseX);
 if (stop == false) {
  float value = random(10,40);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,value,value);
  }
 if (mousePressed && (mouseButton == RIGHT)) {
  background(0xff317E4D);
 }
}

public void mousePressed(){
  if (stop == false) {
    stop = true;
  }else {
    stop = false;
  }
}

public void keyPressed() {
  keysPressed=0;
  for(int i=0;i<keysLowerCase.length;i++)
  {
    if(key == keysLowerCase[i])
    {
      keyStates[i] = true;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }

  for(int i=0;i<keysLowerCase.length;i++)
  {
    if(keyStates[i])
    {
      gainEnvelope.addSegment(0.2f, 5);// over 5 ms rise to 0.2
      fill(255);
      noteFrequency.setValue(tones[i]);
      fill(random(255),random(255),random(255));
      rect(310, 490, 30, 100);
      // out.addSignal(new SineWave(tones[i], amp, out.sampleRate()));
    }
  }
}

 //  gainEnvelope.addSegment(0.2, 5);
 //  keyPress = true;
 //  fill(255);
 //    if(key=='a' || key=='A'){
 //      noteFrequency.setValue(262);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(310, 490, 30, 100);
 //
 //   fill(255);
 //    if (key=='s' || key=='S'){
 //      noteFrequency.setValue(294);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(340, 490, 30, 100);
 //
 //   fill(255);
 //    if (key=='d' || key=='D'){
 //      noteFrequency.setValue(330);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(370, 490, 30, 100);
 //
 //   fill(255);
 //     if (key=='f' || key=='F'){
 //      noteFrequency.setValue(349);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(400, 490, 30, 100);
 //
 //   fill(255);
 //    if (key=='g' || key=='G'){
 //      noteFrequency.setValue(392);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(430, 490, 30, 100);
 //
 //   fill(255);
 //     if (key=='h' || key=='H'){
 //      noteFrequency.setValue(440);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(460, 490, 30, 100);
 //
 //   fill(255);
 //    if (key=='j' || key=='J'){
 //      noteFrequency.setValue(494);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(490, 490, 30, 100);
 //
 //  fill(255);
 //   if (key=='k' || key=='K'){
 //      noteFrequency.setValue(523);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(520, 490, 30, 100);
 //
 //  fill(255);
 //   if (key=='l' || key=='L'){
 //      noteFrequency.setValue(587);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(550, 490, 30, 100);
 //
 //  fill(255);
 //   if (key==';' || key==':'){
 //      noteFrequency.setValue(659);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(580, 490, 30, 100);
 //
 //   fill(255);
 //    if (key=='w' || key=='W'){
 //      noteFrequency.setValue(278);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(332, 490, 15, 60);
 //
 //   fill(255);
 //    if (key=='e' || key=='E'){
 //      noteFrequency.setValue(311);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(362, 490, 15, 60);
 //
 //    fill(255);
 //     if (key=='t' || key=='T'){
 //      noteFrequency.setValue(370);
 //      fill(random(255),random(255),random(255));
 //    }
 //    rect(422, 490, 15, 60);
 //
 //    fill(255);
 //    if (key=='y' || key=='Y'){
 //      noteFrequency.setValue(415);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(452, 490, 15, 60);
 //
 //  fill(255);
 //   if (key=='u' || key=='U'){
 //      noteFrequency.setValue(466);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(482, 490, 15, 60);
 //
 //  fill(255);
 //   if (key=='o' || key=='O'){
 //      noteFrequency.setValue(554);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(542, 490, 15, 60);
 //
 // fill(255);
 //   if (key=='p' || key=='P'){
 //      noteFrequency.setValue(622);
 //      fill(random(255),random(255),random(255));
 //   }
 //   rect(572, 490, 15, 60);



 public void keyReleased()
 {
   keysPressed = 0;
   for(int i=0;i<keysLowerCase.length;i++)
   {
     if(key == keysLowerCase[i])
     {
       keyStates[i] = false;
     }
     if(keyStates[i])
     {
       keysPressed++;
     }
   }


   for(int i=0;i<keysLowerCase.length;i++)
   {
     if(keyStates[i])
     {
       gainEnvelope.addSegment(0.0f, 100);

      //  out.addSignal(new SineWave(tones[i], amp, out.sampleRate()));
     }
   }
 }

 // void keyReleased() {
 //   keyPress= false;
 //     if(keyPress == false) {
 //      gainEnvelope.addSegment(0.0, 100);
 //
 //     }
 //   }


  // A,S,D,F,G,H,J,K,;,W,E,T,Y,U,O,P
  // a,s,d,f,g,h,j,k,;,w,e,t,y,u,o,p
  // 262,294,330,349,392,440,494,523,587,659,278,311,370,415,466,554,622
  // C,D,E,F,G,A,B,C,D,E,CsDf,DsEf,FsGf,GsAf,AsBf,CsDf,DsEf
  public void settings() {  size(920,615); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "modular" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
