/**
 * Implementation-free perspective to be read by developers 
 * who might not necessarily have the source code at hand
 * 
 * Name: Trusting 
 * Date: 2020/2021 
 * @version 
 * @copyright
 * 
 */

import controlP5.*;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
AudioPlayer  kick1, snare1, clap1, hat1, tom1;
//AudioPlayer clap1;
AudioPlayer [] snare = new AudioPlayer [8];
AudioPlayer [] clap = new AudioPlayer [8];
AudioPlayer [] hat = new AudioPlayer [8];
AudioPlayer [] tom = new AudioPlayer [8];

Gain gainAudio;
Pan panAudio;
float panhat = 1.0;

//=================================================================================initialization begins=========================================================================================================================================

//Amplitude amp;

PFont font1, font2, font3;

RadioButton r1, r2, r3, w, time0, transpose0, notes0, pan0, effect0, wave0, delete0;
ControlP5 cp5;
int val = 0, octave = 1, func = 0;
Button i0, k0, sn0, h0, c0, sy0, e0, f0, play, pause;
Button t0, tr0, r0, a0, de0, p0, instrument0, instrument1, instrument2, instrument3, instrument4, instrument5, instrument6, instrument7;
Button [][] patternsArray = new Button[8][8];
Button [][] propertiesArray = new Button[8][8];
Waveform [] disWave = new Waveform[8];

float [] gainValue = new float[8];
int [] bitRes = new int[8];
float [] delayVal = new float[8];
int [] panValue = new int[8];
int [][] decision = new int[8][8];
Button [] instruments = new Button[8];
float[][] instList = new float[8][8];
float[] transVal = new float[8];

ScrollableList lastP;

float attackTimePiano = 0.003;
float sustainTimePiano = 0.004;
float sustainLevelPiano = 0.3;
float releaseTimePiano = 0.4;
//PImage img[] = new PImage[4];
PImage imgKICK, imgSNARE, imgHAT, imgCLAP, imgSYNTH, imgEnvelope;

float attackTimeBass = 0.001;
float sustainTimeBass = 0.004;
float sustainLevelBass = 0.3;
float releaseTimeBass = 0.4;

float attackTimeDrum = 0.005;
float sustainTimeDrum = 0.01;
float sustainLevelDrum = 0.01;
float releaseTimeDrum = 0.4;
int a = 75, b = 100, c = b + 100, entCircleL = 0, entCircleR = 0, entLeft = 0, entRight = 0, entUp = 0, entDown = 0;
int[] property0 = new int[8];
int[] instSelect = new int[8];

int highlight = 0, righty = 8, currentPositionY = 0, currentPositionX = -1;
int upward = 0, redhighlight = 4, leave = 0, close = 0, run = 0, playALL = 0;
int firstVal = 0, intRighty = 3, instUpward = 0, checker = 0, entVal_instrument = 0, entVal_pattern = 0;
int synthSel = 0, notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0;
int currentNotePosition, propLeave = 0, propRighty = 0, propUpward = 0; 
int propHighlight = 0, instPropRighty = 0, instPropUpward = 0, propcurrentPositionX = 0, propcurrentPositionY = 0;
int patList1 = 0, patList2 = 0, decide = 0;
int time = millis();
int time2 = millis();
int time3 = millis();
int FunctionBlinker = 0;

float[] freqBaseVal = new float [7];
//130.81, fr10 = 146.83, fr20 = 164.81, fr30 = 174.61, fr40 = 196.00, fr50 = 220.00, fr60 = 246.94;
float[][] frNew = new float [8][7];
int [] gainValues = new int [8];


//======================================================================================initialization ends=========================================================================================================================================

ToneInstrument[][] myNote;
class ToneInstrument implements Instrument
{
  Oscil sineOsc, sineOsc1, LFO;
  Pan pan, pan1;
  ADSR adsr;
  Delay myDelay, myDelay1;
  BitCrush bitCrush;
  //Gain gain;
  ToneInstrument( float oscFrequency, int panValue, Waveform wave, float gainValue, float delayVal, int bitRes) //for synth
  {
    sineOsc = new Oscil( oscFrequency, gainValue, wave );
    //ADSR(float maxAmp, float attTime, float decTime, float susLvl, float relTime)
    adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );
    bitCrush = new BitCrush(bitRes, out.sampleRate());
    myDelay = new Delay( delayVal, 0.5, true, true );
    pan = new Pan(panValue);
    sineOsc.patch(adsr);
    if (bitRes == 0 && delayVal == 0.0) {
      adsr.patch(pan);
    } else if (bitRes != 0 && delayVal == 0.0) {
      adsr.patch(bitCrush); 
      bitCrush.patch(pan);
    } else if (bitRes == 0 && delayVal != 0.0) {
      adsr.patch(pan); 
      pan.patch(myDelay);
    } else if (bitRes != 0 && delayVal != 0.0) {
      adsr.patch(bitCrush); 
      bitCrush.patch(pan); 
      myDelay.patch(pan);
    }
    //pan.patch( out );
    //LFO = new Oscil( 0.5, 1.0, wave );
    //adsr.patch( pan );
    //LFO.patch( pan.pan );
  }
  ToneInstrument( float oscFrequency, int panValue, Waveform wave, float gainValue, float delayVal)  //for kick
  {
    sineOsc1 = new Oscil( oscFrequency, gainValue, wave );
    adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );
    //adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );
    pan = new Pan(panValue);
    myDelay1 = new Delay( delayVal, 0.1, true, true );
    sineOsc1.patch(adsr);
    //adsr.patch(sineOsc);
    //gain.patch( adsr );
    if (delayVal == 0.0) {
      adsr.patch(pan);
    } else {
      adsr.patch(myDelay1); 
      myDelay1.patch(pan);
    }

    //pan.patch( out );
  }

  void noteOn( float dur )
  {
    pan.patch( out );
    adsr.noteOn();
    //adsr1.noteOn();
    //pan1.patch(out);
  }
  void noteOff()
  {
    pan.unpatch( out );
    //adsr.unpatchAfterRelease( out );
    adsr.noteOff();
    //adsr1.noteOff();
    //pan1.patch(out);
  }
}

//=========================================================================================setup starts=========================================================================================================================================
public void setup() {
  size(1500, 1000);
  frameRate(4);
  font1 = createFont("NewPeninimMT-48.vlw", 10);
  font2 = createFont("SansSerif-30.vlw", 20);
  font3 = createFont("SansSerif-30.vlw", 13);
  imgKICK = loadImage("KICK.png");
  imgSNARE = loadImage("SNARE.jpg");
  imgHAT = loadImage("HAT.jpg");
  imgCLAP = loadImage("CLAP.png");
  imgSYNTH = loadImage("SYNTH.jpg");
  //imgEnvelope = loadImage("ASDR.png");
  minim = new Minim( this );
  out = minim.getLineOut( Minim.STEREO, 2048 );

  cp5 = new ControlP5(this);
  myNote = new ToneInstrument[8][8]; 

  gainAudio = new Gain(-5.f);
    
  for(int i = 0; i < 8; i++){
    snare[i] = minim.loadFile("snare.wav");
  }   
  for(int i = 0; i < 8; i++){
    clap[i] = minim.loadFile("707-clap.wav");
  }  
  for(int i = 0; i < 8; i++){
    hat[i] = minim.loadFile("massive-hi-hat-8.wav");
  }  
  //for(int i = 0; i < 8; i++){
  //  tom[i] = minim.loadFile("808-tom.wav");
  //}
  
  kick1 = minim.loadFile("kiiiik.wav");
  clap1 = minim.loadFile("707-clap.wav");
  hat1 = minim.loadFile("massive-hi-hat-8.wav");
  tom1 = minim.loadFile("808-tom.wav");
  snare1 = minim.loadFile("snare.wav");
  
  kick1.setGain(-20);
  clap1.setGain(-20);
  hat1.setGain(-20);
  snare1.setGain(-20);
  //========================================================================================= Synth Values INITIALIZATION =========================================================================================================================================  
  freqBaseVal[0] = 130.81;
  freqBaseVal[1] = 146.83;
  freqBaseVal[2] = 164.81;
  freqBaseVal[3] = 174.61;
  freqBaseVal[4] = 196.00;
  freqBaseVal[5] = 220.00;
  freqBaseVal[6] = 246.94;
  //float[] fr = new float [7];
  //0, fr1 = 0, fr2 = 0, fr3 = 0, fr4 = 0, fr5 = 0, fr6 = 0;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 7; j++) {
      frNew[i][j] = freqBaseVal[j];
    }
  }
  //========================================================================================= Instrument Selection INITIALIZATION =========================================================================================================================================  
  for (int i = 0; i < 8; i++) {
    transVal[i] = 0.0;
  }
  for (int i = 0; i<8; i++) {
    instSelect[i] = 8;
  }
  for (int i = 0; i<8; i++) {
    disWave[i] = Waves.SINE;
  }
  for (int i = 0; i<8; i++) {
    gainValue[i] = 0.5f;
  }
  for (int i = 0; i<8; i++) {
    bitRes[i] = 0;
  }
  for (int i = 0; i<8; i++) {
    delayVal[i] = 0.0;
  }
  for (int i = 0; i<8; i++) {
    panValue[i] = 0;
  }
  for (int i = 0; i<8; i++) {
    clap[i].setGain(-20);
    snare[i].setGain(-20);
    hat[i].setGain(-20);
  }
  //for (int i = 0; i<8; i++) {
  //  gainValues[i] = 0;
  //}
  //========================================================================================= DECISION INITIALIZATION =========================================================================================================================================  
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) {
      decision[i][j] = 8;
    }
  }
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) { 
      instList[i][j] = 0.0;
    }
  }

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) { 
      myNote[i][j] = new ToneInstrument(instList[i][j], panValue[i], disWave[i], gainValue[i], delayVal[i], bitRes[i]);
    }
  }


  //========================================================================================= INSTRUMENT DROPDOWNLIST ====================================================================================================================================
  for (int m = 0; m < 400; m+=50) {
    int y = m/50;
    instruments[y] = cp5.addButton("instruments" + y).setPosition(130, 75 + m).setSize(360, 30).setColorBackground(color(#FFF7C7)).setCaptionLabel("");
    //print("\ninstruments" + y);
  }

  //========================================================================================= PROPERTY DROPDOWNLIST ====================================================================================================================================
  for (int m = 0; m < 400; m+=50) {
    int y = m/50;
    for (int j = 0; j < 8; j++) {
      patternsArray[y][j] = cp5.addButton("patternsArray" + y + j).setPosition(505 + j*80, a + m).setSize(70, 30).setCaptionLabel("").setColorBackground(#ffffff);
      //print("\npatternsArray" + y + j);
    }
  }

  for (int m = 0; m < 400; m+=50) {
    int y = m/50;
    for (int j = 0; j < 4; j++) { 
      propertiesArray[y][j] = cp5.addButton("propertiesArray" + y + j).setPosition((width/2) + (width/5) + 100 + j*70, a + m).setSize(50, 30).setCaptionLabel("").setColorBackground(#FFED87);
      //print("\npropertiesArray" + y + j);
    }
  }


  //=========================================================================================INSTRUMENT SECTION=========================================================================================================================================
  k0 = cp5.addButton("KICK" +0).setPosition(125, height/2 + 35).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  sn0 = cp5.addButton("SNARE" +0).setPosition(253, height/2 + 35).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  h0 = cp5.addButton("HAT"+0).setPosition(380, height/2 + 35).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  sy0 = cp5.addButton("SYNTH" +0).setPosition(125, height/2 + 170).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  c0 = cp5.addButton("CLAP" +0).setPosition(253, height/2 + 170).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  //e0 = cp5.addButton("ENVELOPES" +0).setPosition(243, height/2 + 230).setSize(95, 80).setColorBackground(#0B1D28).setCaptionLabel("");
  
  t0 = cp5.addButton("GAIN" +0).setPosition(505, height/2 + 35).setSize(110, 120).setColorBackground(color(#FFED87)).setFont(font1).setCaptionLabel("").setColorCaptionLabel(0);
  tr0 = cp5.addButton("TRANSPOSE" +0).setPosition(635, height/2 + 35).setSize(110, 120).setColorBackground(color(#FFED87)).setFont(font1).setCaptionLabel("").setColorCaptionLabel(0);
  r0 = cp5.addButton("EFFECTS"+0).setPosition(765, height/2 + 35).setSize(110, 120).setColorBackground(color(#FFED87)).setFont(font1).setCaptionLabel("").setColorCaptionLabel(0);
  a0 = cp5.addButton("WAVE" +0).setPosition(505, height/2 + 210).setSize(110, 120).setColorBackground(color(#FFED87)).setFont(font1).setCaptionLabel("").setColorCaptionLabel(0);
  de0 = cp5.addButton("DELETE" +0).setPosition(635, height/2 + 210).setSize(110, 120).setColorBackground(color(#FFED87)).setFont(font1).setCaptionLabel("").setColorCaptionLabel(0);
  p0 = cp5.addButton("PAN" +0).setPosition(765, height/2 + 210).setSize(110, 120).setColorBackground(color(#FFED87)).setFont(font1).setCaptionLabel("").setColorCaptionLabel(0);
}

//========================================================================================== DRAW BEGINS ========================================================================================================
public void draw() {
  background(#0B1D28);

  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.0) {
      frNew[propUpward][i] = freqBaseVal[i];
    }
  }

  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 2.0) {
      frNew[propUpward][i] = freqBaseVal[i] * 2;
    }
  }

  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 3.0) {
      frNew[propUpward][i] = freqBaseVal[i] * 4;
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 4.0) {
      frNew[propUpward][i] = freqBaseVal[i] * 6;
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.5) {
      frNew[propUpward][i] = freqBaseVal[i] / 2;
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.25) {
      frNew[propUpward][i] = freqBaseVal[i] / 4;
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.125) {
      frNew[propUpward][i] = freqBaseVal[i] / 6;
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.0625) {
      frNew[propUpward][i] = freqBaseVal[i] / 8;
    }
  }

  //================================================================================NAVIGATING THE PATTERN GRIDS=========================================================================================================================== 
  movingAround();
  
  fill(250);
  textSize(15);
  text("A R R A Y 0:", 30, a + 20);
  text("A R R A Y 1:", 30, a + 70);
  text("A R R A Y 2:", 30, a + 120);
  text("A R R A Y 3:", 30, a + 170);
  text("A R R A Y 4:", 30, a + 220);
  text("A R R A Y 5:", 30, a + 270);
  text("A R R A Y 6:", 30, a + 320);
  text("A R R A Y 7:", 30, a + 370);
  
  if(redhighlight == 2) {
    if (propHighlight == 0) {
      fill(#C62222);
      int passedMillis = millis() - time; // calculates passed milliseconds
      if(passedMillis >= 315){
          time = millis();
        fill(#000000);
      }
      //rect((width/2) + (width/5) + 130, 40, 260, 25);
      rect((width/2) + (width/5) + 95, 35, 270, 35);
      noStroke();
    }
    
    if(propHighlight == 2) {
        stroke(0, 255, 0);
        strokeWeight(8.0);
        strokeCap(ROUND);
      int passedMillis = millis() - time; // calculates passed milliseconds
      if(passedMillis >= 315){
        float r1 = random(255);
        float r2 = random(255);
        float r3 = random(255);
          time = millis();
          stroke(r1, r2, r3);
          strokeWeight(8.0);
          strokeCap(ROUND);
      }
        noStroke();
    }
    if(propHighlight == 3) {
        stroke(0, 255, 0);
        strokeWeight(8.0);
        strokeCap(ROUND);
      int passedMillis = millis() - time; // calculates passed milliseconds
      if(passedMillis >= 315){
        float r1 = random(255);
        float r2 = random(255);
        float r3 = random(255);
          time = millis();
          stroke(r1, r2, r3);
          strokeWeight(8.0);
          strokeCap(ROUND);
      }
        noStroke();
    }
  }
    
  if ((redhighlight == 4 || redhighlight == 1) && highlight == 0) {
    if (leave == 0 ){
      if (redhighlight == 3) {
      }
    
    //if (righty == -1 || righty == 8){
      fill(#C62222);
      int passedMillis = millis() - time; // calculates passed milliseconds
      if(passedMillis >= 315){
          time = millis();
          fill(#000000);
      }
      rect(b + 25, 35, 1010, 35);
      noStroke();
  }
  
    if(leave == 1){
      stroke(0, 255, 0);
      strokeWeight(8.0);
      strokeCap(ROUND);
      int passedMillis = millis() - time; // calculates passed milliseconds
      if(passedMillis >= 315){
        float r1 = random(255);
        float r2 = random(255);
        float r3 = random(255);
        time = millis();
        stroke(r1, r2, r3);
        strokeWeight(8.0);
        strokeCap(ROUND);
      }
      noStroke();
    }
}
  //fill(#FFED87);
  //rect(b + 30, height/2 + 300, 350, 100 );
  //fill(#1D7ABA);
  //rect(515, 40, 640, 25);
  fill(#1E64B6);
  rect(b + 30, 40, 1000, 25);
  //fill(#0B1D28);
  //rect(b + 150, 43, 120, 20);
  fill(#1E64B6);
  rect(b + 30, height/2 , 360, 25);
  fill(#1E64B6);
  rect((width/2) + (width/5) + 100, height/2 , 260, 25);
  fill(#645605);
  rect((width/2) + (width/5) + 100, 40, 260, 25);
  fill(#645605);
  rect(505, height/2 , 370, 25);
  //================================================================================LOOPING THE GRIDS================================================================================
  if (playALL == 0) { 
    int k = 0;
    while (k < run && k < 8) {
      movingRectangles(k);
      k = k + 1;
    }
    gettingInstrumentValues();
    run = (run % 8) + 1;
    playSound(run);
  }
  
  
 
  selectInstrument(); //selecting an Instrument
  if (decide == 1) {
    for ( int f = 0; f < 8; f++) {
      for (int g = 0; g < 8; g++) {
        if (decision[f][g] == 1 && instruments[f].getLabel() == "K I C K") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("K").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
        }
        if (decision[f][g] == 1 && instruments[f].getLabel() == "S N A R E") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("S").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
        }
        if (decision[f][g] == 1 && instruments[f].getLabel() == "H A T") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("H").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
        }
        if (decision[f][g] == 1 && instruments[f].getLabel() == "C L A P") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("C").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
        }
        //if (instList[f][g] == 1 && instruments[f].getLabel() == "S Y N T H") {
        //  cp5.get(controlP5.Button.class, "patternsArray" + f + g).setColorBackground( color(255, 255, 0) );
        //  print("it has been set");
        //}
      }
    }
  }
  if (propHighlight == 1) {
    if (propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7) {
      property0();
    }
  }
  if (propHighlight == 2) {
    if (propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7  ) {
      propFunction0();
    }
  }
  if (propHighlight == 3) {
    if (propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7) {
      propFuncSel0();
    }
  }

  if (propHighlight == 4) {
  }
  

  //fill(255,255,255);
  //rect( (width/2) + (width/5) + 103, height/2 + 30, 250, 100);
  stroke(255);
  line( (width/2) + (width/5) + 205, height/2 + 30, (width/2) + (width/5) + 205, height/2 + 100 );
  line( (width/2) + (width/5) + 205, height/2 + 50, (width/2) + (width/5) + 205, height/2 + 50 );
  noStroke();
  fill(255);
  //textSize(20);
  ////text("CONFIGURATIONS", 1100, height/2 + 330);
  text("ARROW KEYS   to MOVE around grid ",  (width/2) + (width/5) + 103, height/2 + 50);
  text("ENTER KEY      to SELECT", (width/2) + (width/5) + 103, height/2 + 70);
  text("TAB KEY          to EXIT a section", (width/2) + (width/5) + 103, height/2 + 90);
  
  fill(#C6C6C6);
  circle(1300, height/2 + 210, 70);
  circle(1380, height/2 + 210, 70);
  rect((width/2) + (width/5) + 145 , height/2 + 160, 20, 40);
  rect((width/2) + (width/5) + 105 , height/2 + 200, 40, 20);
  rect((width/2) + (width/5) + 165 , height/2 + 200, 40, 20);
  rect((width/2) + (width/5) + 145 , height/2 + 220, 20, 40);

  if (entCircleL == 1) {
    fill (#1D7ABA);
    circle(1300, height/2 + 155, 70);
  }
  if (entCircleR == 1) {
    fill (#1D7ABA);
    circle(1380, height/2 + 155, 70);
  }
  if (entUp == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 145, height/2 + 105, 20, 40);
  }
  if (entLeft == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 105, height/2 + 145, 40, 20);
  }
  if (entRight == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 165, height/2 + 145, 40, 20);
  }
  if (entDown == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 145, height/2 + 165, 20, 40);
  }

  entCircleL = 0;
  entCircleR = 0;
  entLeft = 0;
  entRight = 0;
  entUp = 0;
  entDown = 0;
  
  
   //========================================================================================== Pattern Tag Text ========================================================================================================
  if (synthSel == 1) {
    fill(#645605);
    rect(890, height/2 , 240, 25);
    fill(250);
    textSize(15);
    text("SELECT NOTE", 920, height/2 + 20);
    fill(#FFED87);
    rect(890, height/2 + 35, 240, 295 );
  }    
  fill(250);
  textSize(15);
  text("INSTRUMENT", b + 33, a - 15);
  fill(250);
  textSize(15);
  text("PATTERN ARRAY", 505, a - 15);
  textSize(15);
  text("FUNCTIONS ARRAY", (width/2) + (width/5) + 103 , a - 15);
  text("INSTRUMENT TYPE", b+33, (height/2) + 19);
  text("FUNCTIONS LIST", 507, (height/2) + 19);
  fill(255);
  textSize(15);
  text("C O N T R O L S", (width/2) + (width/5) + 103, height/2 + 19);
  fill(0);
  textSize(15);
  text("ENTER", 1275, height/2 + 215);
  text("TAB", 1365, height/2 + 215);
  
  //fill(255);
  //rect(550, height/2 + 175, 20, 30);
  fill(255);
  textSize(20);
  text("GAIN", 530, height/2 + 180);
  textSize(13);
  text("(change volume)", 510, height/2 + 195); 
  textSize(20);
  text("TRANSPOSE", 635, height/2 + 180);
  textSize(13);
  text("(change synth pitch)", 630, height/2 + 195); 
  textSize(20);
  text("EFFECTS", 780, height/2 + 180);
  textSize(13);
  text("(change sound)", 770, height/2 + 195); 
  textSize(20);
  text("WAVE", 530, height/2 + 360);
  textSize(13);
  text("(choose wave)", 515, height/2 + 375); 
  textSize(20);
  text("DELETE", 645, height/2 + 360);
  textSize(13);
  text("(remove option)", 635, height/2 + 375); 
  textSize(20);
  text("PAN", 790, height/2 + 360);
  textSize(13);
  text("(change sound direction)", 760, height/2 + 375); 
  
  //fill(255);
  //rect(150, height/2 + 120, 60, 30);
  //rect(280, height/2 + 120, 60, 30);
  //rect(410, height/2 + 120, 60, 30);
  //rect(155, height/2 + 255, 60, 30);
  //rect(280, height/2 + 255, 60, 30);
  fill(255);
  textSize(15);
  text("KICK", 160, height/2 + 140);
  text("SNARE", 290, height/2 + 140);
  text("HAT", 420, height/2 + 140);
  text("SYNTH", 160, height/2 + 275);
  text("CLAP", 290, height/2 + 275);
  //text("ENVELOPES", 245, height/2 + 360);
  cp5.setAutoDraw(false); 
  cp5.draw();
  image(imgKICK, 130, height/2 + 40, 105, 75);
  image(imgSNARE, 258, height/2 + 40, 105, 75);
  image(imgHAT, 385, height/2 + 40, 105, 75);
  image(imgSYNTH, 130, height/2 + 175, 105, 75);
  image(imgCLAP, 258, height/2 + 175, 105, 75);
  //image (imgEnvelope, 248, height/2 + 235, 84, 69);
}
//========================================================================================== DRAW ENDS ========================================================================================================
//==================================================================================================================================================================================================


//========================================================================================== Section highlighter ========================================================================================================
void keyPressed() {
  if (keyCode == TAB) {
    entCircleR = 1;
    if (synthSel == 0 && (highlight == 1) && (redhighlight == 1 || redhighlight == 4)) {
      patList1 = 1;
      //instSelect[0] = 0;
      entVal_instrument = 0;
      leave = 0;
      highlight = 0;
      currentPositionX = righty;
      currentPositionY = upward;
    }
    
    if (entVal_pattern == 1 && highlight == 1 && righty >= 0 && (instruments[upward].getLabel() == "S Y N T H") && synthSel == 1 && (redhighlight == 1 || redhighlight == 4)) {
      synthSel = 0;
      highlight = 1;
      entVal_pattern = 0;
      notes0.deactivateAll();
      notes0.hide();
      //entVal_pattern = 0;
      //notesCaptionHide0();
    }

    if ((highlight == 2) && (redhighlight == 1 || redhighlight == 4)) {

      instruments[upward].setCaptionLabel("");
      entVal_instrument = 1;
      highlight--;
      instSelect[upward] = 0;
      patList2 = 1;
      leave = 0;
    }


    if ((propHighlight == 1) && redhighlight == 2) {
      propLeave = 0;
      propHighlight = 0;
      propcurrentPositionX = propRighty;
      propcurrentPositionY = propUpward;
    }

    if ((propHighlight == 2) && redhighlight == 2) {
      propHighlight--;
    }

    if ((propHighlight == 3) && redhighlight == 2) {
      if (instPropUpward == 0) {
        if (instPropRighty == 0) {
          propHighlight--;
          time0.hide();
        }
        if (instPropRighty == 1) {
          propHighlight--;
          transpose0.hide();
        }
        if (instPropRighty == 2) {
          propHighlight--;
          effect0.hide();
        }
      }
      if (instPropUpward == 1) {
        if (instPropRighty == 0) {
          propHighlight--;
          wave0.hide();
        }
        if (instPropRighty == 1) {
          propHighlight--;
          delete0.hide();
        }
        if (instPropRighty == 2) {
          propHighlight--;
          pan0.hide();
        }
      }
    }
  }

  if (keyCode == ENTER) {
    //print("propHighlight =\n" + propHighlight);
    if ( entVal_instrument == 2 && (redhighlight == 1 || redhighlight == 4) ) {
      entVal_instrument = 3;
      
    }
    if (righty > -1 && righty < 8 && entVal_instrument == 1 &&  highlight == 1 && (redhighlight == 1 || redhighlight == 4)) {
      if (decide == 0) {
        decide = 1;
      }
    }
    if ( righty == -1 && entVal_instrument == 1 &&  highlight == 1 && (redhighlight == 1 || redhighlight == 4)) {
      highlight = 2;
      entVal_instrument = 2;
      redhighlight = 1;
      leave = 1;
      instUpward = 0;
      intRighty = 0;
      patList2 = 0;
      //decide = 1;
      for(int i = 0; i < 8; i++){
        if (upward == i) {
          instSelect[upward] = 1;
        }
      }
    }
    if (entVal_instrument == 0 && (redhighlight == 1 || redhighlight == 4) ) {
      righty = -1;
      upward = 0;
      //righty = currentPositionX;
      //upward = currentPositionY;
      highlight = 1;
      patList1 = 0;
      ++entVal_instrument;
      entCircleL = 1;
    }

    if (righty >= 0 && (redhighlight == 1 || redhighlight == 4)) {
      entCircleL = 1;
      if (righty == 8) {
        entVal_instrument = 1;
      } else {
        entVal_pattern = 1;
        
      }
    }

    if (redhighlight == 2 && propHighlight == 3) {
      funcPropSelec();
      FunctionBlinker = 1;
    }
    if (redhighlight == 2 && (propHighlight == 2)) {
      propHighlight++;
      time0Col = 0;
      time0Row = 0;
    }
    if (redhighlight == 2 && (propHighlight == 1)) {
      propHighlight++;
      
    }

    if (redhighlight == 2 && propUpward == 0 && propRighty == 8 && propHighlight == 0) {
      
    } else if (redhighlight == 2 && propRighty != 8 && propHighlight == 0) {
      propHighlight++;
      propUpward = propcurrentPositionY;
      propRighty = propcurrentPositionX;
      propLeave = 1;
    }

    if (entVal_pattern == 1 && highlight == 1 && righty >= 0 && instruments[upward].getLabel() == "S Y N T H" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)) {
      synthSel++;
    }

    if (entVal_pattern == 1 && highlight == 1 && righty >= 0 && instruments[upward].getLabel() == "S Y N T H" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)) {
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide0();
      if (decision[upward][righty] == 1) {
        decision[upward][righty] = 0;
      } else{
        decision[upward][righty] = 1;
      }
    }
  }

  if (key == CODED) {
    if (keyCode == UP) {
      entUp = 1;
      if (highlight == 0 && propHighlight == 0) {
        redhighlight = 1;
      }
      if (highlight == 1 && upward > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        upward--;
      }
      if (entVal_instrument == 2 && highlight == 2 && instUpward > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4) ) {
        instUpward--;
        if(intRighty == 0){
          kick1.rewind();
          kick1.play();
        }
        if(intRighty == 1){
          snare1.rewind();
          snare1.play();
        }
      }
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1  && notes0Col <= 2 && notes0Col >= 1 && (redhighlight == 1 || redhighlight == 4)) {
        --notes0Col;
        
      }
      if (redhighlight == 2 && propHighlight == 1 && propUpward > 0) {
        propUpward--;
      }
      if (redhighlight == 2 && propHighlight == 2 && instPropUpward > 0) {
        instPropUpward--;
        
      }


      if (redhighlight == 2 && propHighlight == 3) {
        if (instPropUpward == 0 && instPropRighty == 0) {
          time0Col--;
          time0Col = constrain(time0Col, 0, 5);
          
        } else if (instPropUpward == 0 && instPropRighty == 1) {
          time0Col--;
          time0Col = constrain(time0Col, 0, 2);
          
        } else if (instPropUpward == 0 && instPropRighty == 2) {
          time0Col--;
          time0Col = constrain(time0Col, 0, 2);
          
        } else if (instPropUpward == 1 && instPropRighty == 0) {
          time0Col--;
          time0Col = constrain(time0Col, 0, 2);
         
        } else if (instPropUpward == 1 && instPropRighty == 1) {
          time0Col--;
          time0Col = constrain(time0Col, 0, 2);
        } else if (instPropUpward == 1 && instPropRighty == 2) {
          time0Col--;
          time0Col = constrain(time0Col, 0, 2);
          
        }
      }
    } else if (keyCode == DOWN) {
      entDown = 1;
      if (highlight == 0 && synthSel == 0 && propHighlight == 0) {
        
      }
      if (highlight == 1 && upward < 7 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        upward++;
      }
      if (entVal_instrument == 2 && highlight == 2 && instUpward < 1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        
        if(intRighty == 0){
          instUpward++;
          
        }
        if(intRighty == 1){
          instUpward++;
          clap1.rewind();
          clap1.play();
        }
        if(intRighty == 2){
          
        }
      }
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1 && notes0Col >= 0 && notes0Col <= 1 && (redhighlight == 1 || redhighlight == 4)) {

        if (notes0Col == 1 && notes0Row > 0) {
          notes0Col++;
          notes0Row = 1;
        } else {
          notes0Col++;
        }
      }
      //propRighty = 8, propUpward = 0, propHighlight = 0 property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0,;
      if (redhighlight == 2 && propHighlight == 1 && propUpward < 8) {
        propUpward++;
        propUpward = constrain (propUpward, 0, 7);
      }
      if (redhighlight == 2 && propHighlight == 2 && instPropUpward == 0) {
        instPropUpward++;
      }


      if (redhighlight == 2 && propHighlight == 3) {
        if (instPropUpward == 0 && instPropRighty == 0) {
          time0Col++;
          time0Col = constrain(time0Col, 0, 5);
        } else if (instPropUpward == 0 && instPropRighty == 1) {
          time0Col++;
          time0Col = constrain(time0Col, 0, 2);
        } else if (instPropUpward == 0 && instPropRighty == 2) {
          time0Col++;
          time0Col = constrain(time0Col, 0, 1);
        } else if (instPropUpward == 1 && instPropRighty == 0) {
          time0Col++;
          time0Col = constrain(time0Col, 0, 2);
          
        } else if (instPropUpward == 1 && instPropRighty == 1) {
          time0Col++;
          time0Col = constrain(time0Col, 0, 1);
        } else if (instPropUpward == 1 && instPropRighty == 2) {
          time0Col++;
          time0Col = constrain(time0Col, 0, 2);
        }
      }
    } else if (keyCode == RIGHT) {
      entRight = 1;
      if (highlight == 0 && propHighlight == 0) {
        redhighlight = 2;
      }
      if (highlight == 1 && righty < 7 && righty >= -1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        righty++;
        //print(righty);
      } 
      if (entVal_instrument == 2 && highlight == 2 && intRighty < 2 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        if(instUpward == 0){
          intRighty++;
          //intRighty = constrain (intRighty, 0, 2);
          if (intRighty == 1){
            snare1.rewind();
            snare1.play();
          }
          if (intRighty == 2){
            hat1.rewind();
            hat1.play();
          }
        }
        if(instUpward == 1){
          intRighty++;
          if (intRighty == 1){
            clap1.rewind();
            clap1.play();
          }
          intRighty = constrain (intRighty, 0, 1);
        }
        print("\n\t\t\t\tinstrumentright =" + intRighty);
        //if(instUpward == 0){
        //  
        //  
        //}
      }
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1 && notes0Row < 2 && (redhighlight == 1 || redhighlight == 4)) {
        if (notes0Col == 2) {
          notes0Row++;
          notes0Row = constrain(notes0Row, 0, 1);
        } else {
          notes0Row++;
        }
      }

      if (redhighlight == 2 && propUpward >= 0 && propRighty >= 0 && propRighty < 7 && propHighlight == 1) {
        propRighty++;
        propRighty = constrain(propRighty, 0, 3);
        
      }
      if (redhighlight == 2 && propHighlight == 2 && instPropRighty < 2) {
        instPropRighty++;
        
      }

      //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
      if (redhighlight == 2 && propHighlight == 3) {
        if (instPropUpward == 0 && instPropRighty == 0) {
          
        } else if (instPropUpward == 0 && instPropRighty == 1) {
          time0Row++;
          time0Row = constrain(time0Row, 0, 2);
          
        } else if (instPropUpward == 0 && instPropRighty == 2) {
          time0Row++;
          time0Row = constrain(time0Row, 0, 1);
          
        } else if (instPropUpward == 1 && instPropRighty == 0) {
          
        } else if (instPropUpward == 1 && instPropRighty == 1) {
          
        } else if (instPropUpward == 1 && instPropRighty == 2) {
          
        }
      }
    } else if (keyCode == LEFT) {
      entLeft = 1;
      if (highlight == 0 && synthSel == 0 && propHighlight == 0) {
        redhighlight = 4;
      }
      if (highlight == 1 && righty > -1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        righty--;
        //print(righty);
      }
      if (entVal_instrument == 2 && highlight == 2 && intRighty > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        intRighty--;
        if(instUpward == 0){
          if (intRighty == 0){
            kick1.rewind();
            kick1.play();
          }
          if (intRighty == 1){
            snare1.rewind();
            snare1.play();
          }
        }
        if(instUpward == 1){
          if (intRighty == 1){
            clap1.rewind();
            clap1.play();
          }
          if (intRighty == 2){
            
          }
        }
      }
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1  && synthSel == 1 && notes0Row > 0 ) {
        notes0Row--;
      }

      //propRighty = 8, propUpward = 0, propHighlight = 0 property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0,;
      if (redhighlight == 2 && propUpward >= 0 && propRighty >= 0 && propRighty < 7 && propHighlight == 1) {
        propRighty--;
        propRighty = constrain(propRighty, 0, 5);
        
      }
      if (redhighlight == 2 && propHighlight == 2 && instPropRighty > 0) {
        instPropRighty--;
        
      }


      if (redhighlight == 2 && propHighlight == 3) {
        if (instPropUpward == 0 && instPropRighty == 0) {
          
        } else if (instPropUpward == 0 && instPropRighty == 1) {
          time0Row--;
          time0Row = constrain(time0Row, 0, 2);
          
        } else if (instPropUpward == 0 && instPropRighty == 2) {
          time0Row--;
          time0Row = constrain(time0Row, 0, 2);
          
        } else if (instPropUpward == 1 && instPropRighty == 0) {
          
        } else if (instPropUpward == 1 && instPropRighty == 1) {
          
        } else if (instPropUpward == 1 && instPropRighty == 2) {
          
        }
      }
    } else {

      //fillVal = 126;
    }
  }
}

void notesCaptionHide0(){
     for(int i = 0; i< 8; i++){
     if(righty == i){
       if(notes0Col == 0){
         if (notes0Row == 0){
           patternsArray[upward][righty].setCaptionLabel("1").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
           //cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(255, 255, 0) );
         }
         if (notes0Row == 1){
           patternsArray[upward][righty].setCaptionLabel("2").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
         }
         if (notes0Row == 2){
           patternsArray[upward][righty].setCaptionLabel("3").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           patternsArray[upward][righty].setCaptionLabel("4").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
         }
         if (notes0Row == 1){
           patternsArray[upward][righty].setCaptionLabel("5").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
         }
         if (notes0Row == 2){
           patternsArray[upward][righty].setCaptionLabel("6").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
         }
       }
       if(notes0Col == 2){
         if (notes0Row == 0){
         patternsArray[upward][righty].setCaptionLabel("7").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
         }
         if (notes0Row == 1){
           patternsArray[upward][righty].setCaptionLabel("").setFont(font2).setColorCaptionLabel(0).setColorBackground(#ffffff);
         }
       }
     }
     }
 }
void notes() {
  notes0 = cp5.addRadioButton("notesRadioButton0");
  notes0.setPosition(930, height/2 + 80);
  notes0.setSize(20, 20);
  notes0.setColorForeground(color(120));
  notes0.setColorActive(color(#C62222));
  notes0.setColorLabel(color(0));
  notes0.setItemsPerRow(3);
  notes0.setSpacingColumn(50);
  notes0.setSpacingRow(50);
  notes0.addItem("1", 1).getItem(0).setFont(font1);
  notes0.addItem("2", 2).getItem(1).setFont(font1);
  notes0.addItem("3", 3).getItem(2).setFont(font1);
  notes0.addItem("4", 4).getItem(3).setFont(font1);
  notes0.addItem("5", 5).getItem(4).setFont(font1);
  notes0.addItem("6", 6).getItem(5).setFont(font1);
  notes0.addItem("7", 7).getItem(6).setFont(font1);
  notes0.addItem("C l e a r", 8).getItem(7).setFont(font1);

  if (notes0Col == 0) {
    if (notes0Row == 0) {
      notes0.activate(0);
    }
    if (notes0Row == 1) {
      notes0.activate(1);
    }
    if (notes0Row == 2) {
      notes0.activate(2);
    }
  }
  if (notes0Col == 1) {
    if (notes0Row == 0) {
      notes0.activate(3);
    }
    if (notes0Row == 1) {
      notes0.activate(4);
    }
    if (notes0Row == 2) {
      notes0.activate(5);
    }
  }
  if (notes0Col == 2) {
    if (notes0Row == 0) {
      notes0.activate(6);
    }
    if (notes0Row == 1) {
      notes0.activate("C l e a r");
    }
  }
}

void playSound(int run){
    for(int i = 0; i < 8; i++){
      if(instruments[i].getLabel() == "S Y N T H" && instList[i][run-1] != 0.0 && patternsArray[i][run-1].getLabel() != ""){
        myNote[i][run-1] = new ToneInstrument(instList[i][run-1] , panValue[i], disWave[i], gainValue[i], delayVal[i], bitRes[i]);
        out.playNote( 0.0, 0.1, myNote[i][run-1] );
      }
     else if (decision[i][run-1] == 1){
        if(instruments[i].getLabel() == "K I C K"){
          instList[i][run-1] = 50.0;
          myNote[i][run-1] = new ToneInstrument(instList[i][run-1] , panValue[i], disWave[i], gainValue[i], delayVal[i]);
          out.playNote( 0.0, 0.05, myNote[i][run-1]);
          print("kick!!!!!!!!!!!!!");
        }
        if(instruments[i].getLabel() == "S N A R E"){
          snare[i].rewind();
          snare[i].play();
        }
        if(instruments[i].getLabel() == "C L A P"){
          
          clap[i].setPan(-1);
          clap[i].rewind();
          clap[i].play(); 
        }
        if(instruments[i].getLabel() == "H A T"){
          hat[i].setPan(-1);
          hat[i].rewind();
          hat[i].play(); 
        }
      }
    }
}

void property0() {
  
  // property section
  for(int i = 0; i < 4; i++){
    if (propRighty == i){
      for (int h = 0; h < 400; h += 50){
        int j = h/50;
        if(propUpward == j){
          fill(color(#C62222));
            int passedMillis = millis() - time; // calculates passed milliseconds
            if(passedMillis >= 315){
                time = millis();
              fill(#000000);
            }
          rect((width/2) + (width/5) + 95 + (i*70), h + 70, 60, 40);
        }
      }
    }
  }
}
// property section after selecting
void propFunction0() {
  
   for(int i = 0; i < 4; i++){
    if (propRighty == i){
      for (int h = 0; h < 400; h += 50){
        int j = h/50;
        if(propUpward == j){
          fill(color(#C62222));
          rect((width/2) + (width/5) + 95 + (i*70), h + 70, 60, 40);
        }
      }
    }
  }
  // lower property section
  for(int i = 0; i < 3; i++){
    if (instPropRighty == i){
      for (int h = 0; h < 100; h += 50){
        int j = h/50;
        if(instPropUpward == j){
          fill(color(#C62222));
            int passedMillis = millis() - time2; // calculates passed milliseconds
            if(passedMillis >= 315){
                time2 = millis();
              fill(#000000);
              print("\nhahaha");
            }
            //print("\nhahaha");
          rect(498 + (i*130), height/2 + 30 + (j*173), 125, 132);
        }
      }
    }
  }
  
}
