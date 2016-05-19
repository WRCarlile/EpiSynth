import beads.*;

AudioContext setUpPatch;
WavePlayer wp;
WavePlayer filterModulator;
Gain filterPatchGain;
Gain g;
Glide noteFrequency;
Glide modulatorFrequency;
Glide filterModulatorFrequency;
Envelope gainEnvelope;
Envelope filterGainEnvelope;
OnePoleFilter filter1;
boolean keyPress;
boolean pen;
boolean patch1;



void makeCanvas() {
    background(#1fa5b1);
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


void setup() {
  size(920,615);
  keyPress = false;
  //SETS UP FOR THE SYNTHESIZER
  setUpPatch = new AudioContext();
  gainEnvelope = new Envelope(setUpPatch, 0.0);
  noteFrequency = new Glide(setUpPatch, 20, 10);
  WavePlayer wp = new WavePlayer(setUpPatch, noteFrequency, Buffer.SINE);
  g = new Gain(setUpPatch, 1, gainEnvelope);
  g.addInput(wp);
  // g.addInput(filterPatchGain);
  setUpPatch.out.addInput(g);

  //FILTER PATCH OSC

  filterGainEnvelope = new Envelope(setUpPatch, 0.0);
  filterModulatorFrequency = new Glide(setUpPatch, 20, 30);
  WavePlayer filterOsc1 = new WavePlayer(setUpPatch, noteFrequency, Buffer.SINE);
  filterModulator = new WavePlayer(setUpPatch, filterModulatorFrequency, Buffer.SAW);
  Function frequencyModulation = new Function(filterModulator) {
     public float calculate() {
     return (x[0] * 100.0) + (mouseY);
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



void draw() {
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

void mousePressed() {
  if (pen == false) {
    filterGainEnvelope.addSegment(0.2, 5);
    pen = true;
  }else {
    pen = false;
    filterGainEnvelope.addSegment(0.0, 50);
  }
}


void keyPressed() {
  keyPress = true;

  if (key=='1') {
    patch1 = true;
  }

  if(key == 'q' || key == 'Q') {
    makeCanvas();
   }

  fill(255);
  if(key=='a' || key=='A'){
    noteFrequency.setValue(262);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(310, 490, 30, 100);

  fill(255);
  if (key=='s' || key=='S'){
    noteFrequency.setValue(294);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(340, 490, 30, 100);

  fill(255);
  if (key=='d' || key=='D'){
    noteFrequency.setValue(330);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(370, 490, 30, 100);

  fill(255);
  if (key=='f' || key=='F'){
    noteFrequency.setValue(349);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(400, 490, 30, 100);

  fill(255);
  if (key=='g' || key=='G'){
    noteFrequency.setValue(392);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(430, 490, 30, 100);

  fill(255);
  if (key=='h' || key=='H'){
    noteFrequency.setValue(440);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(460, 490, 30, 100);

  fill(255);
  if (key=='j' || key=='J'){
    noteFrequency.setValue(494);
    gainEnvelope.addSegment(0.2, 5);
  fill(random(255),random(255),random(255));
  }
  rect(490, 490, 30, 100);

  fill(255);
  if (key=='k' || key=='K'){
    noteFrequency.setValue(523);
    gainEnvelope.addSegment(0.2, 5);
  fill(random(255),random(255),random(255));
  }
  rect(520, 490, 30, 100);

  fill(255);
  if (key=='l' || key=='L'){
    noteFrequency.setValue(587);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(550, 490, 30, 100);

  fill(255);
  if (key==';' || key==':'){
    noteFrequency.setValue(659);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(580, 490, 30, 100);

  fill(255);
  if (key=='w' || key=='W'){
    noteFrequency.setValue(278);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(332, 490, 15, 60);

  fill(255);
  if (key=='e' || key=='E'){
    noteFrequency.setValue(311);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(362, 490, 15, 60);

  fill(255);
  if (key=='t' || key=='T'){
    noteFrequency.setValue(370);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(422, 490, 15, 60);

  fill(255);
  if (key=='y' || key=='Y'){
    noteFrequency.setValue(415);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
   }
  rect(452, 490, 15, 60);

  fill(255);
  if (key=='u' || key=='U'){
    noteFrequency.setValue(466);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(482, 490, 15, 60);

  fill(255);
  if (key=='o' || key=='O'){
    noteFrequency.setValue(554);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(542, 490, 15, 60);

  fill(255);
  if (key=='p' || key=='P'){
    noteFrequency.setValue(622);
    gainEnvelope.addSegment(0.2, 5);
    fill(random(255),random(255),random(255));
  }
  rect(572, 490, 15, 60);
}

void keyReleased() {
  gainEnvelope.addSegment(0.0, 100);
  // filterGainEnvelope.addSegment(0.0, 100);
}