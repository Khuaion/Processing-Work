int gameState = 0;
int frameCounter = 0;
boolean dataload1 = false, dataload2 = false;
boolean isGifPlaying = false;

void setup() {
  size(800, 800);
    // Fonts
  customFont = createFont("data/fonts/Cubic_11_1.100_R.ttf", 32);
  textFont(customFont);
  
  open = loadImage("data/img/Open.jpg");
  open_p = loadImage("data/img/Open_p.jpg");
  
  backgroundMusic = new SoundFile(this, "data/sound/urban-lofi-dreamscape-by-sascha-ende-from-filmmusic-io.mp3");
  clickSound = new SoundFile(this, "data/sound/506054__mellau__button-click-1.wav");
  backgroundMusic.loop();
}

void draw() {
  background(0); 
  switch (gameState) {
    case 0:
      showOpenScene();
      break;
    case 1:
      showLv1Intro();
      break;
    case 2:
      showLevel1Button();
      break;
    case 3:
      lv1Draw();
      break;
    case 4:
      showLoseScreen();
      break;
    case 5:
      showWin1Screen();
      break;
    case 6:
      showLv2Intro();
      break;
    case 7:
      showLevel2Button();
      break;
    case 8:
      lv2Draw();
      break;
    case 9:
      showLoseScreen();
      break;
    case 10:
      showWin2Screen();
      break;
    case 11:
      showEndingScreen();
      break;
    case 12:
      showLv1_S2(); 
      break;
    case 13:
      showLv2_S2(); 
      break;
  }
  
}


void keyPressed() {
  if (key == ' ' || keyCode == ENTER) {
    clickSound.play();
    if (!isGifPlaying) {
      switch (gameState) {
        case 0:
          if (!dataload1) {
            dataLoadLv1();
            dataload1 = true;
          }
          gameState = 1;
          lv1_s1_startTime = millis(); // Start timer for lv1_s1
          lv1_s1.play(); // Start playing the GIF
          writeWithPen.play();
          break;
        case 2:
          gameState = 3;
          lv1Setup();
          break;
        case 4:
          gameLost = false;
          lv1Setup();
          gameState = 3;
          break;
        case 5:
          if (!dataload2) {
            dataLoadLv2();
            dataload2 = true;
          }
          gameState = 6;
          lv2_s1_startTime = millis(); // Start timer for lv2_s1
          lv2_s1.play(); // Start playing the GIF
          walkingSound.play();
          break;
        case 7:
          gameState = 8;
          lv2Setup();
          break;
        case 9:
          lv2Setup();
          fearValue = 0;
          countdown = 60;
          mazeLitCounter = 0;
          mazeLit = false;
          collectedLightBalls = 0;
          frameCount = 0;
          initialRevealCounter = 5 * 30; 
          isProtected = false;
          protectionCounter = 0;
          gameLost2 = false;
          gameState = 8; 
          break;
        case 10:
          gameState = 13;
          lv2_s2_startTime = millis(); // Start timer for lv2_s2
          lv2_s2.play(); // Start playing the GIF
          walkingSound.play();
          break;
        case 11:
          resetGame();
          gameState = 0;
          break;
        case 12:
          gameState = 5; 
          break;
        case 13:
          gameState = 10; 
          break;
      }
    }
  }
  
  if (gameState == 8) {
    lv2keyPressed();
  } else if (gameState == 3) {
    lv1keyPressed();
  }
}

void showLv1_S2() {
  image(lv1_s2, 0, 0, width, height);
  isGifPlaying = true;
  if (millis() - lv1_s2_startTime > lv1_s2_duration) {
    gameState = 5;
    isGifPlaying = false;
  }
}

void showLv2_S2() {
  image(lv2_s2, 0, 0, width, height);
  isGifPlaying = true; 
  if (millis() - lv2_s2_startTime > lv2_s2_duration) {
    gameState = 11;
    isGifPlaying = false; 
  }
}

void mousePressed() {
  clickSound.play();
  if (gameState == 3) {
    lv1MousePressed();
  }
}

void showOpenScene() {
  if (frameCounter % 60 < 30) {
    image(open, 0, 0, width, height);
  } else {
    image(open_p, 0, 0, width, height);
  }
  frameCounter++;
}

void showLv1Intro() {
  image(lv1_s1, 0, 0, width, height);
  isGifPlaying = true;
  if (millis() - lv1_s1_startTime > lv1_s1_duration) {
    gameState = 2;
    isGifPlaying = false;
  }
}

void showLevel1Button() {
  if (frameCounter % 60 < 30) {
    image(level1_black, 0, 0, width, height);
  } else {
    image(level1_white, 0, 0, width, height);
  }
  frameCounter++;
}

void showLoseScreen() {
  if (frameCounter % 60 < 30) {
    image(lose, 0, 0, width, height);
  } else {
    image(lose_pressed, 0, 0, width, height);
  }
  frameCounter++;
}

void showWin1Screen() {
  if (frameCounter % 60 < 30) {
    image(win1, 0, 0, width, height);
  } else {
    image(win1_pressed, 0, 0, width, height);
  }
  frameCounter++;
}

void showLv2Intro() {
  image(lv2_s1, 0, 0, width, height);
  isGifPlaying = true;
  if (millis() - lv2_s1_startTime > lv2_s1_duration) {
    gameState = 7;
    isGifPlaying = false;
  }
}

void showLevel2Button() {
  if (frameCounter % 60 < 30) {
    image(level2_black, 0, 0, width, height);
  } else {
    image(level2_white, 0, 0, width, height);
  }
  frameCounter++;
}

void showWin2Screen() {
  if (frameCounter % 60 < 30) {
    image(win2, 0, 0, width, height);
  } else {
    image(win2_pressed, 0, 0, width, height);
  }
  frameCounter++;
}

void showEndingScreen() {
  if (frameCounter % 60 < 30) {
    image(ending, 0, 0, width, height);
  } else {
    image(ending_pressed, 0, 0, width, height);
  }
  frameCounter++;
}

void resetGame() {
  gameState = 0;
  frameCounter = 0;

  // Reset level-specific variables
  lv1_s1_startTime = 0;
  lv1_s2_startTime = 0;
  lv2_s1_startTime = 0;
  lv2_s2_startTime = 0;

  // Reset game state variables
  gameWon = false;
  gameLost = false;
  selectedColorIndex = -1;
  startTime = 0;
  errorMessage = "";
  errorStartTime = 0;

  // Reset Level 1 variables
  fillColor = new color[8];
  for (int i = 0; i < 8; i++) {
    fillColor[i] = color(random(255), random(255), random(255));
  }

  playerR.loop();
  generateEquations();
  generateBoxes();

  // Reset Level 2 variables
  fearValue = 0;
  countdown = 60;
  mazeLitCounter = 0;
  mazeLit = false;
  collectedLightBalls = 0;
  frameCount = 0;
  initialRevealCounter = 5 * 30;
  isProtected = false;
  protectionCounter = 0;
  gameWon2 = false;
  gameLost2 = false;

  // Reinitialize grid and player for Level 2
  cols = width / w; 
  rows = ((height - 50) - 50) / w; 
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i, j);
    }
  }
  player = new Player(0, 0);
  exitCell = grid[cols - 1][rows - 1];

  // Reinitialize obstacles for Level 2
  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i < 8; i++) {
    int x = int(random(cols));
    int y = int(random(rows));
    obstacles.add(new Obstacle(x, y));
  }

  // Stop all sounds and reset
  backgroundMusic.stop();
  writeWithPen.stop();
  clickSound.stop();
  walkingSound.stop();
  
  lv1_s1.stop();
  lv1_s2.stop();
  lv2_s1.stop();
  lv2_s2.stop();
  playerR.stop();

  backgroundMusic.loop();
}
