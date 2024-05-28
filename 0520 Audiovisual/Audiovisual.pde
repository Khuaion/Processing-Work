import gifAnimation.*;
Gif[] myAnimation;

import themidibus.*;
MidiBus myBus;

/********************************************************************************************************************/
color   clrBG    = #202020;
int     midiPitch = 0;
int     midiChannel = 0;

/********************************************************************************************************************/
void setup() {
  size(600, 600, P3D);
  MidiBus.list();
  //                 Parent In Out
  //                   |    |  |
  myBus = new MidiBus(this, 1, 1);
  // Set the "In" number equals to the port created in "Audio MIDI Setup / LoopMIDI" number in the Console

  myAnimation = new Gif[4];
  for (int i = 0; i < myAnimation.length; i++) {
    myAnimation[i] = new Gif(this, "TE_"+i+".gif");
    myAnimation[i].play();
  }
  frameRate(30);
  
  cols = (width + gridSize) / gridSize;
  rows = (height + gridSize) / gridSize;
  grid = new PVector[cols][rows];

  // Initialize grid points
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      grid[x][y] = new PVector(x * gridSize, y * gridSize);
    }
  }

  circles = new ArrayList<PVector>();
  circleRadii = new ArrayList<Float>();

  // Create initial circles
  for (int i = 0; i < initialCircles; i++) {
    int cx = (int) random(cols) * gridSize;
    int cy = (int) random(rows) * gridSize;
    circles.add(new PVector(cx, cy));
    circleRadii.add(random(20, 50));
  }
  numCircles = initialCircles;
  
}

/********************************************************************************************************************/
void draw() {
  pitchAnimation();
  channelColor();
}

/********************************************************************************************************************/
void pitchAnimation() {
  background(clrBG);
  //if (midiPitch == 72) { //C4 in Orca
  //  wave();
  //  //image(myAnimation[0], 0, 0);
  //} else if (midiPitch == 60) { //C3 in Orca
  //  randomLine();
  //  //image(myAnimation[1], 0, 0  );
  //} else if (midiPitch == 62) {
  //  grid();
  //  //image(myAnimation[2], 0, 0  );
  //} else {
  //  play();
  //  //image(myAnimation[3], 0, 0  );
  //}
  if (midiPitch % 5 == 0 ) { //C4 in Orca
    wave();
    //grid();
  } else {
    grid();
  }
}

/********************************************************************************************************************/
void channelColor() {
  //if (midiChannel == 0) {
  //  clrBG = #A8C9C7;
  //} else if (midiChannel == 1) {
  //  clrBG = #B9C9A8;
  //} else if (midiChannel == 2) {
  //  clrBG = #C9B8A8;
  //} else {
  //  clrBG = #B0A8C9;
  //}
  if (midiChannel == 0 ) {
    clrBG = #A8C9C7;
  } else if(midiChannel == 2 ){
    clrBG = #AEC9A8;
  } else {
    clrBG = #B9C9A8;
  }
}

/********************************************************************************************************************/
void noteOn(int channel, int pitch, int velocity) {
  println("noteOn", channel, pitch, velocity);
  midiChannel = channel;
  midiPitch = pitch;
}

/********************************************************************************************************************/
void noteOff(int channel, int pitch, int velocity) {
  //println("noteOff", channel, pitch, velocity);
}
