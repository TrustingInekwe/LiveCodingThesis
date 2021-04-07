/**
 *
 * Name: TRUSTING O. INEKWE 
 * Date: 2020/2021 
 * @version 
 * @copyright
 * 
 */
import static javax.swing.JOptionPane.*;
import controlP5.*;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
AudioPlayer  kick1, snare1, clap1, hat1, tom1;

// CREATING IMAGE OBJECTS FOR INSTRUMENTS AND THE BLOCK PROPERTY
PImage imgKICK, imgSNARE, imgHAT, imgCLAP, imgSYNTH, imgEnvelope, imgDanger;

// CREATING AUDIOPLAYER OBJECTS FOR INSTRUMENTS
AudioPlayer [] snare = new AudioPlayer [8]; 
AudioPlayer [] clap = new AudioPlayer [8];
AudioPlayer [] hat = new AudioPlayer [8];
AudioPlayer [] tom = new AudioPlayer [8];


//=================================================================================initialization begins=========================================================================================================================================

ControlP5 cp5; // creating an instance of controlP5 object

PFont font1, font2, font3; // creating font variables

RadioButton time0, transpose0, notes0, pan0, effect0, wave0, delete0; //radiobuttons for sythn and function list
Button i0, k0, sn0, h0, c0, sy0, e0, f0, play, pause; 
Button t0, tr0, r0, a0, de0, p0;
Button [][] patternsArray = new Button[8][8]; // Creating 16block array for the PATTERNS ARRAY
Button [][] propertiesArray = new Button[8][8]; // Creating an array of 16 blocks for the PROPERTIES ARRAY

Waveform [] disWave = new Waveform[8]; // Creating an array of waveforms for synth and kick
float [] gainValue = new float[8]; // Creating an array of GAINVALUES FOR INSTRUMENTS
int [] bitRes = new int[8]; // Creating an array of BITCRUSH OBJECTS
float [] delayVal = new float[8]; // Creating an array of DELAY VALUES
int [] panValue = new int[8]; // Creating an array of PAN VALUES
int [][] decision = new int[8][8]; // Creating an array for PATTERN ARRAY SELECTION DECISIONS
Button [] instruments = new Button[8]; // Creating an array of INSTRUMENT BUTTONS(BOXES)
float[][] instList = new float[8][8]; // Creating an array of FREQUENCEY VALUES for each ROW that has a SYNTH or KICK
float[] transVal = new float[8]; // Creating an array of TRANSPOSE VALUES FOR EACH ROW

int a = 75, b = 100, c = b + 100; // Some values used for button layout
int entCircleL = 0, entCircleR = 0, entLeft = 0, entRight = 0, entUp = 0, entDown = 0; // values for XBOX-like buttons
int[] property0 = new int[8];
int[] instSelect = new int[8]; // creating an array of instruments for EACH ROW

int highlight = 0; // highlight for selecting PATTERN ARRAY AREA
int righty = 8, currentPositionY = 0, currentPositionX = -1; // "righty" for moving RIGHT AND LEFT in the PATTERN AREA, "currentPositionY/X" for last position in the PATTERN ARRAY
int upward = 0; // "upward" for MOVING UP and DOWN in the PATTERN AREA
int redhighlight = 4, leave = 0, close = 0, run = 0, playALL = 0; // "redhighlight = 4" for selecting the INSTRUMENT and PATTERN ARRAY SECTION area
int intRighty = 3, instUpward = 0;  // "intRighty" for moving R/L the FUNCTION LIST and "instUpward" for moving U/D the FUNCTION LIST
int entVal_instrument = 0; // used for selectin the instrument section of the INSTRUMENT and PATTERN ARRAY area
int entVal_pattern = 0; // used for selectin the pattern array section of the INSTRUMENT and PATTERN ARRAY area
int synthSel = 0; // determines if a synth pattern can be created
int notes0Row = 0, notes0Col = 0; // used for moving around the synth radio buttons "notes0Row" for moving L/R a row, "notes0Col" for moving UP/DOWN a column
int time0Row = 0, time0Col = 0; // used for moving around the property arguments "time0Row" for moving around a row, "time0Col" for moving around a column
int propLeave = 0; // used when exiting the property section (0 = exit, 1 = enter)
int propRighty = 0, propUpward = 0; // "propRighty" for moving RIGHT AND LEFT in the PROPERTY AREA, "propUpward" for moving UP and DOWN in the PROPERTY AREA
int propHighlight = 0; // for selcting the function property section
int instPropRighty = 0, instPropUpward = 0; // "instPropRighty" for moving RIGHT AND LEFT in the FUNCTION LIST AREA, "instPropUpward" for moving UP and DOWN in the FUNCTION LIST AREA
int propcurrentPositionX = 0, propcurrentPositionY = 0; // for saving the current version of the property area.
int patList1 = 0; // used for moving around the pattern array (0 = you can move around the instrument and PATTERN ARRAY, 1 = you can't!)
int patList2 = 0; // used for moving around the instrument type section after moving around the PATTERN ARRAY
int decide = 0; // Seleccting choice in the PATTERN ARRAY

//Returns the number of milliseconds (thousandths of a second) since starting the program
int time = millis(); 
int time2 = millis();
int time3 = millis();

float[] freqBaseVal = new float [7]; // creating an array for base frequency values for the synth and kcik
float[][] frNew = new float [8][7]; // creating an array for new frequency values for the synth and kick
int [] gainValues = new int [8]; // creating an array for gainValues for the synth
//======================================================================================initialization ends=========================================================================================================================================
ToneInstrument[][] myNote; // creating an array of ToneInstrument Class

class ToneInstrument implements Instrument
{
  Oscil sineOsc, sineOsc1, LFO; // creating Oscillator variables
  Pan pan, pan1; // creating Pan variables
  ADSR adsr; // creating ADSR variables
  Delay myDelay, myDelay1; // creating Delay variables
  BitCrush bitCrush; // creating BitCrush variables
  
  // CONSTRUCTOR FOR SYNTH
  ToneInstrument( float oscFrequency, int panValue, Waveform wave, float gainValue, float delayVal, int bitRes) 
  {
    sineOsc = new Oscil( oscFrequency, gainValue, wave ); //Initializing Oscillator variable
    adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 ); //Initializing ADSR variable
    bitCrush = new BitCrush(bitRes, out.sampleRate()); //Initializing BitCrush variable
    myDelay = new Delay( delayVal, 0.5, true, true ); //Initializing Delay variable
    pan = new Pan(panValue); //Initializing Pan variable
    sineOsc.patch(adsr); // Patching
    if (bitRes == 0 && delayVal == 0.0) {  //if there is no delay AND no bitcrush value entered for the syth
      adsr.patch(pan);
    } else if (bitRes != 0 && delayVal == 0.0) {  //if there is no delay BUT bitcrush value entered for the syth
      adsr.patch(bitCrush); 
      bitCrush.patch(pan);
    } else if (bitRes == 0 && delayVal != 0.0) {   //if there is a delay BUT NO bitcrush value entered for the kick
      adsr.patch(pan); 
      pan.patch(myDelay);
    } else if (bitRes != 0 && delayVal != 0.0) {   //if BOTH delay and bitcrush value entered for the kick
      adsr.patch(bitCrush); 
      bitCrush.patch(pan); 
      myDelay.patch(pan);
    }
  }
  
  // CONSTRUCTOR FOR KICK
  ToneInstrument( float oscFrequency, int panValue, Waveform wave, float gainValue, float delayVal)
  {
    sineOsc1 = new Oscil( oscFrequency, gainValue, wave ); //Initializing Oscillator variable
    adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 ); //Initializing ADSR variable
    pan = new Pan(panValue); //Initializing Pan variable
    myDelay1 = new Delay( delayVal, 0.1, true, true ); //Initializing Delay variable
    sineOsc1.patch(adsr); //Patching
    if (delayVal == 0.0) { //if there is no delay entered for the kick
      adsr.patch(pan);
    } else {
      adsr.patch(myDelay1); 
      myDelay1.patch(pan);
    }
  }

  void noteOn( float dur )
  {
    pan.patch( out ); //PANNING THE SOUND 
    adsr.noteOn(); //SWITCHING ON ADSR FOR THE SOUND 
  }
  void noteOff()
  {
    pan.unpatch( out ); // UNPANNING THE SOUND
    //adsr.unpatchAfterRelease( out );
    adsr.noteOff(); //SWITCHING OFF ADSR FOR THE SOUND 
  }
}

//========================================================================================= SETUP STARTS =========================================================================================================================================
public void setup() {
  size(1500, 1000); // SETTING THE SIZE OF THE WINDOW
  
  frameRate(4); //SETTING THE FRAME RATE FOR THE DRAW FUNCTION
  
  // SETTING THE FONTS IN THE SYSTEM
  font1 = createFont("NewPeninimMT-48.vlw", 15);
  font2 = createFont("SansSerif-30.vlw", 20);
  font3 = createFont("SansSerif-30.vlw", 13);
  // SETTING THE IMAGES IN THE SYSTEM
  imgKICK = loadImage("KICK.png");
  imgSNARE = loadImage("SNARE.jpg");
  imgHAT = loadImage("HAT.jpg");
  imgCLAP = loadImage("CLAP.png");
  imgSYNTH = loadImage("SYNTH.jpg");
  imgDanger = loadImage("danger.png");
  //imgEnvelope = loadImage("ASDR.png");
  minim = new Minim( this );
  out = minim.getLineOut( Minim.STEREO, 2048 );

  // CREATING AN INSTANCE OF CONTROLP5 LIBRARY
  cp5 = new ControlP5(this);
  
  // CREATING AN ARRAY OF TONEINSTRUMENT OF A MUSICAL NOTE
  myNote = new ToneInstrument[8][8]; 

  // CREATING AN INSTANCE OF MINIM LIBRARY GAIN OBJECT AND INITIALIZING THE VALUE TO -5.0
  //gainAudio = new Gain(-5.f);
  
  // INITIALIZING THE INSTRUMENTS ARRAYS
  for(int i = 0; i < 8; i++){
    snare[i] = minim.loadFile("snare.wav");
  }   
  for(int i = 0; i < 8; i++){
    clap[i] = minim.loadFile("707-clap.wav");
  }  
  for(int i = 0; i < 8; i++){
    hat[i] = minim.loadFile("massive-hi-hat-8.wav");
  }  
  
  // INITIALIZING THE INSTRUMENTS THAT SOUND WHEN YOU MOVE AROUND THE INSTRUMENT TYPE
  kick1 = minim.loadFile("kiiiik.wav");
  clap1 = minim.loadFile("707-clap.wav");
  hat1 = minim.loadFile("massive-hi-hat-8.wav");
  tom1 = minim.loadFile("808-tom.wav");
  snare1 = minim.loadFile("snare.wav");
  
  // INITIALIZING THE INSTRUMENTS GAIN VALUE TO -20
  kick1.setGain(-20);
  clap1.setGain(-20);
  hat1.setGain(-20);
  snare1.setGain(-20);
  // Synth Values INITIALIZATION 
  freqBaseVal[0] = 130.81;
  freqBaseVal[1] = 146.83;
  freqBaseVal[2] = 164.81;
  freqBaseVal[3] = 174.61;
  freqBaseVal[4] = 196.00;
  freqBaseVal[5] = 220.00;
  freqBaseVal[6] = 246.94;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 7; j++) {
      frNew[i][j] = freqBaseVal[j];
    }
  }
  
  //  Functions in Function List INITIALIZATION  
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
  
  //  PATTERN ARRAY CHOSEN CHOICES (DECISION) ARRAY INITIALIZATION   
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) {
      decision[i][j] = 8;
    }
  }
  //  PATTERN ARRAY FREQUENCY FOR CHOSEN CHOICES (DECISION) ARRAY INITIALIZATION
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) { 
      instList[i][j] = 0.0;
    }
  }
  //  PATTERN ARRAY FREQUENCY FOR CHOSEN CHOICES (DECISION) ARRAY INITIALIZATION
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) { 
      myNote[i][j] = new ToneInstrument(instList[i][j], panValue[i], disWave[i], gainValue[i], delayVal[i], bitRes[i]);
    }
  }
  
  // INSTRUMENT BOXES(BUTTONS) CREATION FOR SELECTED INSTRUMENT
  for (int m = 0; m < 400; m+=50) {
    int y = m/50;
    instruments[y] = cp5.addButton("instruments" + y).setPosition(130, 75 + m).setSize(360, 30).setColorBackground(color(#B0D5FF)).setCaptionLabel("");
  }

  // PATTERN BOXES(BUTTONS) CREATION 
  for (int m = 0; m < 400; m+=50) {
    int y = m/50;
    for (int j = 0; j < 8; j++) {
      patternsArray[y][j] = cp5.addButton("patternsArray" + y + j).setPosition(505 + j*80, a + m).setSize(70, 30).setCaptionLabel("").setColorBackground(#ffffff);
      //print("\npatternsArray" + y + j);
    }
  }
  
  //PROPERTY BOXES(BUTTONS) CREATION
  for (int m = 0; m < 400; m+=50) {
    int y = m/50;
    for (int j = 0; j < 4; j++) { 
      propertiesArray[y][j] = cp5.addButton("propertiesArray" + y + j).setPosition((width/2) + (width/5) + 100 + j*70, a + m).setSize(50, 30).setCaptionLabel("").setColorBackground(#FFAB28);
      //print("\npropertiesArray" + y + j);
    }
  }


  // INSTRUMENT BOXES(BUTTONS) CREATION FOR INSTRUMENT TYPE
  k0 = cp5.addButton("KICK" +0).setPosition(125, height/2 + 35).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  sn0 = cp5.addButton("SNARE" +0).setPosition(253, height/2 + 35).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  h0 = cp5.addButton("HAT"+0).setPosition(380, height/2 + 35).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  sy0 = cp5.addButton("SYNTH" +0).setPosition(125, height/2 + 170).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  c0 = cp5.addButton("CLAP" +0).setPosition(253, height/2 + 170).setSize(115, 85).setColorBackground(#0B1D28).setCaptionLabel("");
  //e0 = cp5.addButton("ENVELOPES" +0).setPosition(243, height/2 + 230).setSize(95, 80).setColorBackground(#0B1D28).setCaptionLabel("");
  
  // FUNCTIONS BOXES(BUTTONS) CREATION FOR PROPERTY SECTION
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
 
  // USING THE BASE FREQUENCY FOR SYNTH INSTRUMENTS
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.0) {
      frNew[propUpward][i] = freqBaseVal[i];
    }
  }
  
  // TRANSPOSING THE FREQUENCY FOR SYNTH INSTRUMENTS
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 2.0) {
      frNew[propUpward][i] = freqBaseVal[i] * 2; // TRANSPOSING AN OCTAVE UP
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 3.0) {
      frNew[propUpward][i] = freqBaseVal[i] * 4; // TRANSPOSING HIGHER
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 4.0) {
      frNew[propUpward][i] = freqBaseVal[i] * 6;
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.5) {
      frNew[propUpward][i] = freqBaseVal[i] / 2; // TRANSPOSING AN OCTAVE DOWN
    }
  }
  for (int i = 0; i < 7; i++) {
    if (transVal[propUpward] == 0.25) {
      frNew[propUpward][i] = freqBaseVal[i] / 4; // TRANSPOSING LOWER
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

  // NAVIGATING AROUND THE PATTERN BOXES(GRIDS)
  movingAround();
  
  // TEXT FOR PATTERN ROWS
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
  
  
  // RECTANGLE FOR SECTION HEADERS
  fill(#1E64B6);
  rect(b + 30, 40, 1005, 25); //Pattern Array rectangle
  fill(#9D6000);
  rect((width/2) + (width/5) + 100, 40, 260, 25); //Functions array rectangle
  //fill(#084C5C);
  //rect(b + 30, height/2 , 360, 25); //Instrument type rectangle
  //fill(#181501);
  //rect((width/2) + (width/5) + 100, height/2 , 260, 25); //Control rectangle
  //fill(#181501);
  //rect(505, height/2 , 370, 25); //Functions List rectangle
  
  
  //HIGHLIGHTING THE INSTRUMENT AND PATTERN SECTION
  if(redhighlight == 1 || redhighlight == 4){ 
    if(entVal_instrument == 0){
      fill(#1E64B6);
        int passedMillis = millis() - time; // calculates passed milliseconds
        if(passedMillis >= 315){
            time = millis();
            //float r = random(100, 150);
          fill(#B0D5FF); // TEXT FOR PATTERN BOXES
        }
      rect(b + 30, 40, 1005, 25); //Pattern Array rectangle
    }
    if(entVal_instrument == 1 || entVal_instrument == 2){
      fill(#1E64B6);
      rect(b + 30, 40, 1005, 25); //Pattern Array rectangle
    }
  }
  
  if(redhighlight == 2){ 
    if(propHighlight == 0){
      fill(#3F3600);
      int passedMillis = millis() - time; // calculates passed milliseconds
        if(passedMillis >= 315){
            time = millis();
            //float r = random(30, 54);
          //fill(63, r, 0);
          fill(#E7AD54);
        }
      rect((width/2) + (width/5) + 100, 40, 260, 25);
    }
  }
  
  
  
  // MOVING DOTS THE GRIDS
  if (playALL == 0) { 
    int k = 0;
    while (k < run && k < 8) {
      movingRectangles(k); // TEXT FOR PATTERN BOXES
      k = k + 1;
    }
    gettingInstrumentValues();
    run = (run % 8) + 1;
    playSound(run); // PLAYING A SELECTED PATTERN
  }
  
  // SELECTING AN INSTRUMENT
  selectInstrument(); 
  
  // SELECTING CHOICES IN THE PATTERN ARRAY
  if (decide == 1) {
    for ( int f = 0; f < 8; f++) {
      for (int g = 0; g < 8; g++) {
        if (decision[f][g] == 1 && instruments[f].getLabel() == "K I C K") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("K").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#B0D5FF) );
        }
        if (decision[f][g] == 1 && instruments[f].getLabel() == "S N A R E") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("S").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#B0D5FF) );
        }
        if (decision[f][g] == 1 && instruments[f].getLabel() == "H A T") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("H").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#B0D5FF) );
        }
        if (decision[f][g] == 1 && instruments[f].getLabel() == "C L A P") {
          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("C").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#B0D5FF) );
        }
      }
    }
  }
  
  // SELECTING THE FUNCTION ARRAY
  if (propHighlight == 1) {
    if (propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7) {
      property0();
    }
  }
  // SELECTING THE FUNCTION LIST
  if (propHighlight == 2) {
    if (propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7  ) {
      propFunction0();
    }
  }
  // SELECTING THE FUNCTION PARAMETER SECTION
  if (propHighlight == 3) {
    if (propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7) {
      propFuncSel0();
    }
  }

  if (propHighlight == 4) {
  }
  
  
  // TEXT FOR THE CONTROLS SECTION
  noStroke();
  stroke(255);
  line( (width/2) + (width/5) + 205, height/2 + 30, (width/2) + (width/5) + 205, height/2 + 100 );
  line( (width/2) + (width/5) + 205, height/2 + 50, (width/2) + (width/5) + 205, height/2 + 50 );
  noStroke();
  fill(255);
  textFont(font1);
  text("ARROW KEYS   to MOVE around grid ",  (width/2) + (width/5) + 103, height/2 + 50);
  text("ENTER KEY      to SELECT", (width/2) + (width/5) + 103, height/2 + 70);
  text("TAB KEY          to EXIT a section", (width/2) + (width/5) + 103, height/2 + 90);
  
  // XBOX CONTROLLER BUTTONS
  fill(#C6C6C6);
  circle(1300, height/2 + 210, 70);
  circle(1380, height/2 + 210, 70);
  rect((width/2) + (width/5) + 145 , height/2 + 160, 20, 40);
  rect((width/2) + (width/5) + 105 , height/2 + 200, 40, 20);
  rect((width/2) + (width/5) + 165 , height/2 + 200, 40, 20);
  rect((width/2) + (width/5) + 145 , height/2 + 220, 20, 40);
  
  // XBOX CONTROLLER HIGHLIGHTING
  if (entCircleL == 1) {
    fill (#1D7ABA);
    circle(1300, height/2 + 210, 70);
  }
  if (entCircleR == 1) {
    fill (#1D7ABA);
    circle(1380, height/2 + 210, 70);
  }
  if (entUp == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 145, height/2 + 160, 20, 40);
  }
  if (entLeft == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 105, height/2 + 200, 40, 20);
  }
  if (entRight == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 165, height/2 + 200, 40, 20);
  }
  if (entDown == 1) {
    fill (#1D7ABA);
    rect((width/2) + (width/5) + 145, height/2 + 220, 20, 40);
  }
  
  // XBOX CONTROLLER COLOR HIGHLIGHT DESELECTION
  entCircleL = 0;
  entCircleR = 0;
  entLeft = 0;
  entRight = 0;
  entUp = 0;
  entDown = 0;
  
  
   // SELECTING A SYNTH
  if (synthSel == 1) {
    fill(255);
    textSize(15);
    text("SELECT NOTE", 890, height/2 + 20);
    fill(#FFCD80);
    rect(890, height/2 + 35, 240, 295 );
  }   
  
  // HEADINGS FOR SECTIONS
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
  
  // TEXT FOR XBOX
  fill(0);
  textSize(15);
  text("ENTER", 1275, height/2 + 215);
  text("TAB", 1365, height/2 + 215);
  
  // FUNCTION NAMES AND DEFINITIONS
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
  
  
  // INSTRUMENT NAMES
  fill(255);
  textSize(15);
  text("KICK", 160, height/2 + 140);
  text("SNARE", 290, height/2 + 140);
  text("HAT", 420, height/2 + 140);
  text("SYNTH", 160, height/2 + 275);
  text("CLAP", 290, height/2 + 275);
  //text("ENVELOPES", 245, height/2 + 360);
  
  //INSTRUMENT IMAGES
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
    entCircleR = 1; //XBOX BUTTON HIGHLIGHTING
    
    // EXITING THE PATTERNS SEXTION
    if (synthSel == 0 && (highlight == 1) && (redhighlight == 1 || redhighlight == 4)) {
      patList1 = 1;
      //instSelect[0] = 0;
      entVal_instrument = 0;
      leave = 0;
      highlight = 0;
      currentPositionX = righty;
      currentPositionY = upward;
    }
    
    // EXITING SYNTH VALUES
    if ((entVal_pattern == 1) && (highlight == 1) && (righty >= 0) && (instruments[upward].getLabel() == "S Y N T H") && (synthSel == 1) && (redhighlight == 1 || redhighlight == 4)) {
      synthSel = 0;
      highlight = 1;
      entVal_pattern = 0;
      notes0.deactivateAll();
      notes0.hide();
      //entVal_pattern = 0;
      //notesCaptionHide0();
    }
    
    // EXITING INSTRUMENT SELECTION
    if ((highlight == 2) && (redhighlight == 1 || redhighlight == 4)) {
      //instruments[upward].setCaptionLabel("");
      entVal_instrument = 1;
      highlight--;
      instSelect[upward] = 0;
      patList2 = 1;
      leave = 0;
    }

    // EXITING THE FUNCTION ARRAY SECTION
    if ((propHighlight == 1) && redhighlight == 2) {
      propLeave = 0;
      propHighlight = 0;
      propcurrentPositionX = propRighty;
      propcurrentPositionY = propUpward;
    }
    
    // EXITING THE FUNCTION LIST SECTION
    if ((propHighlight == 2) && redhighlight == 2) {
      propHighlight--;
    }
    
    // EXITING THE FUNCTION PARAMETERS SECTION
    if ((propHighlight == 3) && redhighlight == 2) {
      if (instPropUpward == 0) {
        if (instPropRighty == 0) {
          propHighlight--;
          time0.hide();
        }
        if (instPropRighty == 1) {
          if (instruments[propUpward].getLabel() == "S Y N T H"){
            transpose0.hide();
          }
          propHighlight--;
          
        }
        if (instPropRighty == 2) {
          propHighlight--;
          if (instruments[propUpward].getLabel() == "S Y N T H"){
            effect0.hide();
          }
        }
      }
      if (instPropUpward == 1) {
        if (instPropRighty == 0) {
          propHighlight--;
          if (instruments[propUpward].getLabel() == "S Y N T H"){
            wave0.hide();
          }
        }
        if (instPropRighty == 1) {
          propHighlight--;
          delete0.hide();
        }
        if (instPropRighty == 2) {
          propHighlight--;
          if ((instruments[propUpward].getLabel() == "S Y N T H") || (instruments[propUpward].getLabel() == "K I C K") || (instruments[propUpward].getLabel() == "S N A R E")){
            pan0.hide();
          }
        }
      }
    }
  }

  if (keyCode == ENTER) {
      entCircleL = 1; //XBOX BUTTON HIGHLIGHTING
      
    // ENTERING THE PATTERN ARRAY SECTION
    if ( entVal_instrument == 2 && (redhighlight == 1 || redhighlight == 4) ) {
      entVal_instrument = 3;
      
    }
    // SELECTING A CELL IN THE PATTERN ARRAY 
    if (righty > -1 && righty < 8 && entVal_instrument == 1 &&  highlight == 1 && (redhighlight == 1 || redhighlight == 4)) {
      if (decide == 0) {
        decide = 1;
      }
    }
    // ENTERING THE INSTRUMENT TYPE SECTION
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
    
    // ENTERING THE PATTERN ARRAY SECTION
    if (entVal_instrument == 0 && (redhighlight == 1 || redhighlight == 4) ) {
      righty = -1;
      upward = 0;
      //righty = currentPositionX;
      //upward = currentPositionY;
      highlight = 1;
      patList1 = 0;
      ++entVal_instrument;
    }
    
    // SELCTING THE CELLS IN THE PATTERN ARRAY
    if (righty >= 0 && (redhighlight == 1 || redhighlight == 4)) {
      entCircleL = 1;
      if (righty == 8) {
        entVal_instrument = 1;
      } else {
        entVal_pattern = 1;
        
      }
    }
    
    // SELECTING A FUNCTION ARGUMENT
    if (redhighlight == 2 && propHighlight == 3) {
      funcPropSelec();
    }
    // ENTERING THE A FUNCTION ARGUMENT SECTION
    if (redhighlight == 2 && (propHighlight == 2)) {
      propHighlight++;
      time0Col = 0;
      time0Row = 0;
    }
    // ENTERING THE FUNCTION LIST SECTION
    if (redhighlight == 2 && (propHighlight == 1)) {
      propHighlight++;
      
    }

    if (redhighlight == 2 && propUpward == 0 && propRighty == 8 && propHighlight == 0) {
      
    }
    
    else if (redhighlight == 2 && propRighty != 8 && propHighlight == 0) {
      propHighlight++;
      propUpward = propcurrentPositionY;
      propRighty = propcurrentPositionX;
      propLeave = 1;
    }
    
    // SELECTING A CELL AFTER SELECTING A SYNTH INSTRUMENT
    if (entVal_pattern == 1 && highlight == 1 && righty >= 0 && instruments[upward].getLabel() == "S Y N T H" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)) {
      synthSel++;
    }
    // APPLYING A CHOSEN SYNTH VALUE
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
      entUp = 1; //XBOX BUTTIN HIGHLIGHTING
      
      
      if (highlight == 0 && propHighlight == 0) {
        redhighlight = 1;
      }
      
      // MOVING UP PATTERN ARRAY
      if (highlight == 1 && upward > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        upward--;
      }
      // MOVING UP INSTRUMENT TYPE
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
      
      // MOVING UP SYNTH OPTIONS
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1  && notes0Col <= 2 && notes0Col >= 1 && (redhighlight == 1 || redhighlight == 4)) {
        --notes0Col;
      }
      
      // MOVING UP THE FUNCTION ARRAY
      if (redhighlight == 2 && propHighlight == 1 && propUpward > 0) {
        propUpward--;
      }
      // MOVING UP THE FUNCTION LIST
      if (redhighlight == 2 && propHighlight == 2 && instPropUpward > 0) {
        instPropUpward--;
        
      }

      // MOVING UP THE FUNCTION PARAMETERS
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
      entDown = 1; // XBOX BUTTON HIGHLIGHING
      if (highlight == 0 && synthSel == 0 && propHighlight == 0) {
        
      }
      // MOVING DOWN THE PATTERN AND INSTRUMENT AREA 
      if (highlight == 1 && upward < 7 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        upward++;
      }
      // MOVING DOWN THE INSTRYMENT TYPE
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
      // MOVING DOWN THE SYNTH VALUES
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1 && notes0Col >= 0 && notes0Col <= 1 && (redhighlight == 1 || redhighlight == 4)) {

        if (notes0Col == 1 && notes0Row > 0) {
          notes0Col++;
          notes0Row = 1;
        } else {
          notes0Col++;
        }
      }
     // MOVING DOWN THE PROPERTY AREA
     if (redhighlight == 2 && propHighlight == 1 && propUpward < 8) {
        propUpward++;
        propUpward = constrain (propUpward, 0, 7);
      }
      if (redhighlight == 2 && propHighlight == 2 && instPropUpward == 0) {
        instPropUpward++;
      }
      // MOVING DOWN THE FUNCTION PARAMETERS
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
      entRight = 1; // XBOX BUTTON HIGHLIGHTING
      // MOVING RIGHT THE SECTION HIGHLIGHING
      if (highlight == 0 && propHighlight == 0) {
        redhighlight = 2;
      }
      // MOVING RIGHT THE PATTERN AND INSTRUMENT AREA
      if (highlight == 1 && righty < 7 && righty >= -1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        righty++;
        //print(righty);
      } 
      // MOVING RIGHT THE INSTRUMENT OPTIONS
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
        //if(instUpward == 0){
        //  
        //  
        //}
      }
      // MOVING RIGHT THE SYNTH VALUES
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1 && notes0Row < 2 && (redhighlight == 1 || redhighlight == 4)) {
        if (notes0Col == 2) {
          notes0Row++;
          notes0Row = constrain(notes0Row, 0, 1);
        } else {
          notes0Row++;
        }
      }
      // MOVING RIGHT THE FUNCTION PROPERTIES
      if (redhighlight == 2 && propUpward >= 0 && propRighty >= 0 && propRighty < 7 && propHighlight == 1) {
        propRighty++;
        propRighty = constrain(propRighty, 0, 3);
        
      }
      // MOVING RIGHT THE FUNCTION LIST
      if (redhighlight == 2 && propHighlight == 2 && instPropRighty < 2) {
        instPropRighty++;
        
      }

      // MOVING RIGHT THE FUNCTION PARAMETERS
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
      entLeft = 1; //XBOX BUTTON HIGHLIGHTING
      if (highlight == 0 && synthSel == 0 && propHighlight == 0) {
        redhighlight = 4;
      }
      // MOVING LEFT THE PATTERN AND INSTRUMENT AREA
      if (highlight == 1 && righty > -1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)) {
        righty--;
        //print(righty);
      }
      // MOVING LEFT THE INSTRUMENT OPTIONS
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
      // MOVING LEFT THE SYNTH OPTIONS
      if (entVal_pattern == 1 && highlight == 1 && synthSel == 1  && synthSel == 1 && notes0Row > 0 ) {
        notes0Row--;
      }

      // MOVING LEFT THE PROPERTY SECTION
      if (redhighlight == 2 && propUpward >= 0 && propRighty >= 0 && propRighty < 7 && propHighlight == 1) {
        propRighty--;
        propRighty = constrain(propRighty, 0, 5);
      }
      // MOVING LEFT THE FUNCTION LIST
      if (redhighlight == 2 && propHighlight == 2 && instPropRighty > 0) {
        instPropRighty--;
      }
      // MOVING LEFT THE FUNCTION PARAMETERS
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

// FUNCTION FOR ASSIGNING MUSICAL NOTES
void notesCaptionHide0(){
     for(int i = 0; i< 8; i++){
     if(righty == i){
       if(notes0Col == 0){
         if (notes0Row == 0){
           patternsArray[upward][righty].setCaptionLabel("1").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(255, 255, 0) );
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

// FUNCTION FOR MUSICAL NOTES RADIO BUTTOINS
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

// FUNCTION FOR PLAYING CREATED PATTERNS
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
        //print("kick!!!!!!!!!!!!!");
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
// FUNCTION FOR MOVING AROUND THE PROPERTY SECTION
void property0() {
  // upper property section
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

// FUNCTION FOR FUNCTION LIST SECTION 
void propFunction0() {
  // Function property section remains selected
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
  
  // Function list section
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
                //print("\nhahaha");
              }
            rect(498 + (i*130), height/2 + 29 + (j*175), 125, 132);
            fill(#0B1D28);
            rect(503 + (i*130), height/2 + 33 + (j*175), 116, 126);
        }
      }
    }
  }
  
}
