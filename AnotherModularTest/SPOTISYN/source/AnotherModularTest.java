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

public class AnotherModularTest extends PApplet {



AudioContext setUpPatch;
AudioContext filterPatch;
WavePlayer wp;
WavePlayer modulator;
WavePlayer filterModulator;
Gain filterPatchGain;
Gain g;
Glide noteFrequency;
Glide modulatorFrequency;
Glide filterModulatorFrequency;
Envelope gainEnvelope;
Envelope filterGainEnvelope;
OnePoleFilter filter1;
boolean pen;
boolean patch1;
boolean setUpPatchToggle;
boolean filterPatchToggle;

public void makeCanvas() {
    background(0xff1fa5b1);
    //KEYBOARD OUTLINE
    //KEYBOARD is 405px w and 100px h
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

public void setup() {
  
  //SETS UP FOR THE SYNTHESIZER
  setUpPatch = new AudioContext();
  gainEnvelope = new Envelope(setUpPatch, 0.0f);
  noteFrequency = new Glide(setUpPatch, 20, 10);
  WavePlayer wp = new WavePlayer(setUpPatch, noteFrequency, Buffer.SINE);
  g = new Gain(setUpPatch, 1, gainEnvelope);
  g.addInput(wp);
  setUpPatch.out.addInput(g);

  //FILTER PATCH OSC

  filterGainEnvelope = new Envelope(setUpPatch, 0.0f);
  filterModulatorFrequency = new Glide(setUpPatch, 20, 30);
  WavePlayer filterOsc1 = new WavePlayer(setUpPatch, noteFrequency, Buffer.SINE);
  filterModulator = new WavePlayer(setUpPatch, filterModulatorFrequency, Buffer.SAW);
  Function frequencyModulation = new Function(filterModulator) {
     public float calculate() {
     return (x[0] * 100.0f) + (mouseY);
    }
  };
  filter1 = new OnePoleFilter(setUpPatch, frequencyModulation);
  filterPatchGain = new Gain(setUpPatch, 1, filterGainEnvelope);
  filter1.addInput(filterOsc1);
  filterPatchGain.addInput(filter1);
  setUpPatch.out.addInput(filterPatchGain);


  setUpPatch.start();
  //SETS UP THE CANVAS WITH BACKGROUND AND KEYBOARD
  makeCanvas();
}





//   delayIn = new TapIn(ac, 2000);
//
//   filter1.addInput(wp);
//   g.addInput(filter1);
//   delayIn.addinput(g);
//   delayOut = new TapOut(ac, delayIn, 500.0);
//   delayGain = new Gain(ac, 1, 0.50);
//   delayGain.addInput(delayOut);
//   ac.out.addInput(delayGain);
//   ac.out.addInput(g);


public void draw() {
  if(patch1 == true) {
    float value = random(mouseX,10);
    translate(width/2,height/2);
    rotate(mouseX);
    fill(random(255),random(255),random(255));
    ellipse(mouseX-100,value,mouseY,value);
  }

  if (pen == true) {
    filterModulatorFrequency.setValue((mouseX + 100));
    float value = random(10,40);
    fill(random(255),random(255),random(255));
    ellipse(mouseX,mouseY,value,value);
  }
}

public void mousePressed() {
  setUpPatchToggle();
  filterPatchToggle();
  if (pen == false) {
    pen = true;
  }else {
    pen = false;
  }
}

//TURN ON AND OFF THE PSYCHEDELIC ELIPES TRIGGERED BY THE KEY '1'
public void patch1() {
  if (patch1 == false){
    patch1 = true;
  } else {
    patch1 = false;
  }
}

//TURN ON AND OFF THE SETUP PATCH OSCILLATOR TRIGGERED BY THE MOUSEPRESSED
public void setUpPatchToggle() {
  if (setUpPatchToggle == false){
    setUpPatchToggle = true;
  } else {
    setUpPatchToggle = false;
  }
}
//TURN ON AND OFF THE FILTER PATCH OSCILLATOR TRIGGERED BY THE MOUSEPRESSED
public void filterPatchToggle(){
  if(filterPatchToggle == false) {
    filterPatchToggle = true;
  } else {
    filterPatchToggle = false;
  }
}

public void keyPressed() {
  System.out.println(pen);
  if (key=='1') {
    patch1();
  }

  if(key == 'q' || key == 'Q') {
    makeCanvas();
   }

  fill(255);
  if(key=='a' || key=='A'){
    noteFrequency.setValue(262);

    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(310, 490, 30, 100);

  fill(255);
  if (key=='s' || key=='S'){
    noteFrequency.setValue(294);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(340, 490, 30, 100);

  fill(255);
  if (key=='d' || key=='D'){
    noteFrequency.setValue(330);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(370, 490, 30, 100);

  fill(255);
  if (key=='f' || key=='F'){
    noteFrequency.setValue(349);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(400, 490, 30, 100);

  fill(255);
  if (key=='g' || key=='G'){
    noteFrequency.setValue(392);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(430, 490, 30, 100);

  fill(255);
  if (key=='h' || key=='H'){
    noteFrequency.setValue(440);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(460, 490, 30, 100);

  fill(255);
  if (key=='j' || key=='J'){
    noteFrequency.setValue(494);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
  fill(random(255),random(255),random(255));
  }
  rect(490, 490, 30, 100);

  fill(255);
  if (key=='k' || key=='K'){
    noteFrequency.setValue(523);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
  fill(random(255),random(255),random(255));
  }
  rect(520, 490, 30, 100);

  fill(255);
  if (key=='l' || key=='L'){
    noteFrequency.setValue(587);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(550, 490, 30, 100);

  fill(255);
  if (key==';' || key==':'){
    noteFrequency.setValue(659);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(580, 490, 30, 100);

  fill(255);
  if (key=='w' || key=='W'){
    noteFrequency.setValue(278);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(332, 490, 15, 60);

  fill(255);
  if (key=='e' || key=='E'){
    noteFrequency.setValue(311);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(362, 490, 15, 60);

  fill(255);
  if (key=='t' || key=='T'){
    noteFrequency.setValue(370);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(422, 490, 15, 60);

  fill(255);
  if (key=='y' || key=='Y'){
    noteFrequency.setValue(415);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
   }
  rect(452, 490, 15, 60);

  fill(255);
  if (key=='u' || key=='U'){
    noteFrequency.setValue(466);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(482, 490, 15, 60);

  fill(255);
  if (key=='o' || key=='O'){
    noteFrequency.setValue(554);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(542, 490, 15, 60);

  fill(255);
  if (key=='p' || key=='P'){
    noteFrequency.setValue(622);
    if (pen == false) {
      gainEnvelope.addSegment(0.2f, 5);
    } else {
      filterGainEnvelope.addSegment(0.2f, 5);
    }
    fill(random(255),random(255),random(255));
  }
  rect(572, 490, 15, 60);
}

public void keyReleased() {
    filterGainEnvelope.addSegment(0.0f, 100);
    gainEnvelope.addSegment(0.0f, 100);

}
  public void settings() {  size(920,615); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "AnotherModularTest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
