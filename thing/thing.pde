import beads.*;
AudioContext ac;
WavePlayer wp;
Gain g;
Glide gainGlide;
Glide frequencyGlide;

float bx;
float by;
int boxSize = 50;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);
  
  size(700,800);
  ac = new AudioContext();
  gainGlide = new Glide(ac, 0.0, 50);
  frequencyGlide = new Glide(ac, 20, 50);
  wp = new WavePlayer(ac, 440, Buffer.SINE);
  g = new Gain(ac, 1, gainGlide);

  g.addInput(wp);
  ac.out.addInput(g);
  ac.start();
  
  background(0); // set the background to black
  text("The mouse X-Position controls volume.", 100, 100);
  text("The mouse Y-Position controls frequency.", 100, 120);
}

void draw() { 
  background(0);
  
  // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
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

  // Draw the box
  rect(bx, by, boxSize, boxSize);
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