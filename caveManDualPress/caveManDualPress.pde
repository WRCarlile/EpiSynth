import beads.*;

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

void setup()
{
  size(920,615);
  keyStates = new boolean[keysLowerCase.length];
  // keyPress = false;
  ac = new AudioContext();

  gainEnvelope = new Envelope(ac, 0.0);
  noteFrequency = new Glide(ac, 20, 10);
  modulatorFrequency = new Glide(ac, 20, 30);
  modulator = new WavePlayer(ac, modulatorFrequency, Buffer.SAW);
  Function frequencyModulation = new Function(modulator) {
   public float calculate() {
   return (x[0] * 500.0) + mouseY;
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

void draw() {
 modulatorFrequency.setValue(mouseX);
 if (stop == false) {
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
      gainEnvelope.addSegment(0.2, 5);// over 5 ms rise to 0.2
      fill(255);
      noteFrequency.setValue(tones[i]);
      fill(random(255),random(255),random(255));
      rect(310, 490, 30, 100);
      // out.addSignal(new SineWave(tones[i], amp, out.sampleRate()));
    }
  }
}

 void keyReleased()
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
       gainEnvelope.addSegment(0.0, 100);

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
