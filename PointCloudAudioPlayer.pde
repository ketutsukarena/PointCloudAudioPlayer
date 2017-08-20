import processing.opengl.*;
import SimpleOpenNI.*;
import ddf.minim.*;

SimpleOpenNI kinect;

float rotation = 0;

Minim minim;

AudioController pianoreverse;
AudioController pianobass;
AudioController bassdrum;
AudioController hihat;
AudioController snare;
AudioController clap;
AudioController bell;
AudioController pad;

Hotpoint pianoreverseTrigger;
Hotpoint pianobassTrigger;
Hotpoint bassdrumTrigger;
Hotpoint hihatTrigger;
Hotpoint snareTrigger;
Hotpoint clapTrigger;
Hotpoint bellTrigger;
Hotpoint padTrigger;

float s = 1;

void setup(){
  size(1480, 820, OPENGL);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  
  minim = new Minim(this);
  
  pianoreverse = new AudioController("pianoreverse.mp3", -80);
  pianobass = new AudioController("pianobass.mp3", -80);
  bassdrum = new AudioController("bassdrum.mp3", -80);
  hihat = new AudioController("hihat.mp3", -80);
  snare = new AudioController("snare.mp3", -80);
  clap = new AudioController("clap.mp3", -80);
  bell = new AudioController("bell.mp3", -80);
  pad = new AudioController("pad.mp3", -80);
                      
  pianoreverseTrigger = new Hotpoint(0,0,600,500,500,400);
  pianobassTrigger = new Hotpoint(0,0,1000,500,500,400);
  bassdrumTrigger = new Hotpoint(0,0,1400,500,500,400);
  hihatTrigger = new Hotpoint(0,0,1800,500,500,400);
  snareTrigger = new Hotpoint(0,0,2200,500,500,400);
  clapTrigger = new Hotpoint(0,0,2600,500,500,400);
  bellTrigger = new Hotpoint(0,0,3000,500,500,400);
  padTrigger = new Hotpoint(0,0,3400,500,500,400);
}

void draw(){
  background(0);
  kinect.update();
  
  translate(width/2,height/2,-1000);
  rotateX(radians(180));
  
  translate(0,0,1400);
  rotateY(radians(map(mouseX,0,width,-180,180)));
  
  translate(0,0,s*-1000);
  scale(s);
  
  stroke(255);
  
  PVector[] depthPoints = kinect.depthMapRealWorld();
  
  for(int i=0; i < depthPoints.length; i+=10){
    PVector currentPoint = depthPoints[i];
    
    pianoreverseTrigger.check(currentPoint);
    pianobassTrigger.check(currentPoint);
    bassdrumTrigger.check(currentPoint);
    hihatTrigger.check(currentPoint);
    snareTrigger.check(currentPoint);
    clapTrigger.check(currentPoint);
    bellTrigger.check(currentPoint);
    padTrigger.check(currentPoint);

    point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
  
  if(pianoreverseTrigger.isHit()){
    pianoreverse.switchPlay();
  }
  
  if(pianobassTrigger.isHit()){
    pianobass.switchPlay();
  }
  
  if(bassdrumTrigger.isHit()){
    bassdrum.switchPlay();
  }
  
  if(hihatTrigger.isHit()){
    hihat.switchPlay();
  }
  
  if(snareTrigger.isHit()){
    snare.switchPlay();
  }

  if(clapTrigger.isHit()){
    clap.switchPlay();
  }

  if(bellTrigger.isHit()){
    bell.switchPlay();
  }
  
  if(padTrigger.isHit()){
    pad.switchPlay();
  }
  
  pianoreverseTrigger.draw();
  pianoreverseTrigger.clear();
  pianobassTrigger.draw();
  pianobassTrigger.clear();
  bassdrumTrigger.draw();
  bassdrumTrigger.clear();
  hihatTrigger.draw();
  hihatTrigger.clear();
  snareTrigger.draw();
  snareTrigger.clear();
  clapTrigger.draw();
  clapTrigger.clear();
  bellTrigger.draw();
  bellTrigger.clear();
  padTrigger.draw();
  padTrigger.clear();  
}

void keyPressed(){
  if(keyCode == 38){
    s = s + 0.2;
  }
  if(keyCode == 40){
    s = s - 0.2;
  }
}
