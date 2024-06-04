import gifAnimation.*;
import processing.sound.*;


PImage open, open_p;
// lv1
PImage lv1_bg;
// lv2
PImage lv2_bg, playerRabbit, obstacle1, obstacle2;

PImage level1_black, level1_white, level2_black, level2_white;
PImage lose, lose_pressed, win1, win1_pressed, win2, win2_pressed, ending, ending_pressed;

// plot
Gif lv1_s1, lv1_s2, lv2_s1, lv2_s2;
// Lv1 Character
Gif playerR;
// sound Effect
SoundFile backgroundMusic, writeWithPen, clickSound, winSound, loseSound, walkingSound;

int lv1_s1_duration = 38000; 
int lv1_s2_duration = 12000; 
int lv2_s1_duration = 36000; 
int lv2_s2_duration = 36200; 

int lv1_s1_startTime, lv1_s2_startTime;
int lv2_s1_startTime, lv2_s2_startTime;


PFont customFont;

void dataLoadLv1(){
  //// Fonts
  //customFont = createFont("data/fonts/Cubic_11_1.100_R.ttf", 32);
  //textFont(customFont);
  
  // Start
  //open = loadImage("data/img/Open.jpg");
  //open_p = loadImage("data/img/Open_p.jpg");
  // Lv1 Bg
  lv1_bg = loadImage("data/img/Level1 BG.png");
  // Lv1_s1
  lv1_s1 = new Gif(this, "data/img/L1 S1 EN.gif");
  // Lv1_1-1
  level1_black = loadImage("data/img/Level 1 button black.jpg");
  level1_white = loadImage("data/img/Level 1 button white.jpg");
  // Lv1_s2
  lv1_s2 = new Gif(this, "data/img/L1 S2 EN.gif");
  // Lv1 Character
  playerR = new Gif(this, "data/img/player.gif");
  
  // Lv1_win
  win1 = loadImage("data/img/WIN_1.jpg");
  win1_pressed = loadImage("data/img/WIN_1_pressed_dot.jpg");
  
  // Lose
  lose = loadImage("data/img/LOSE.jpg");
  lose_pressed = loadImage("data/img/LOSE_pressed_dot.jpg");

  // End
  ending = loadImage("data/img/ENDING_1.jpg");
  ending_pressed = loadImage("data/img/ENDING_1_pressed_dot.jpg");
  
  // bgm
  //backgroundMusic = new SoundFile(this, "data/sound/urban-lofi-dreamscape-by-sascha-ende-from-filmmusic-io.mp3");
  // coversation gif
  writeWithPen = new SoundFile(this, "data/sound/write_with_pen.mp3");

  winSound = new SoundFile(this, "data/sound/winSound.mp3");

  
}

void dataLoadLv2(){
    // Lv2 Bg
  lv2_bg = loadImage("data/img/Level2 BG.png");
  // Lv2_s1
  lv2_s1 = new Gif(this, "data/img/L2_S1_EN.gif");
  // Lv2_s1-1
  level2_black = loadImage("data/img/Level 2 button black.jpg");
  level2_white = loadImage("data/img/Level 2 button white.jpg");
  // Lv2_s2
  lv2_s2  = new Gif(this, "data/img/L2_S2_EN.gif");
  // Lv2 Character
  playerRabbit = loadImage("data/img/player.png");
  obstacle1 = loadImage("data/img/obstacle1.png");
  obstacle2 = loadImage("data/img/obstacle2.png");
  // Lv2_win
  win2 = loadImage("data/img/WIN_2.jpg");
  win2_pressed = loadImage("data/img/WIN_2_pressed_dot.jpg");
  // Lose
  lose = loadImage("data/img/LOSE.jpg");
  lose_pressed = loadImage("data/img/LOSE_pressed_dot.jpg");
  
  // Lv2_walk
  walkingSound = new SoundFile(this, "data/sound/Walking2.mp3");
  // win
  winSound = new SoundFile(this, "data/sound/winSound.mp3");

}
