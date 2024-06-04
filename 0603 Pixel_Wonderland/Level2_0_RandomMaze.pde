// Lv2 Code
int cols, rows; // Maze's Rows & Column
int w = 20; // width
Cell[][] grid; // grid of cell  => ChatGPT
Player player;
int lightBalls = 0; 
int collectedLightBalls = 0;
boolean mazeLit = false; // Light maze up
int mazeLitCounter = 0; 
int countdown = 60; // countdown timer for the game (second)
int frameCount = 0;
int initialRevealCounter = 5 * 30; // 5 seconds at 30 fps
//boolean gameWon = false; // if player win or not
Cell exitCell; // exit
ArrayList<Cell> stack = new ArrayList<Cell>(); //  generating the maze => ChatGPT
boolean gameWon2 = false;
boolean gameLost2 = false;
ArrayList<Obstacle> obstacles;
int fearValue = 0;
boolean isProtected = false;
int protectionCounter = 0;

void lv2Setup() {
  cols = width / w; // Adjust number of columns based on new width
  rows = ((height - 50) - 50) / w; // Adjust number of rows based on new height range
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i, j);
    }
  }
  player = new Player(0, 0);
  exitCell = grid[cols - 1][rows - 1];
  frameRate(30); // 30 frames per second
  generateMaze();
  
  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i < 8; i++) {
    int x = int(random(cols));
    int y = int(random(rows));
    obstacles.add(new Obstacle(x, y));
  }
}

void lv2Draw() {
  if (gameWon2) {
    imageMode(CORNER);
    // Lv2 Scene
    gameState = 10;
    return;
  }else if( gameLost2 ){
    imageMode(CORNER);
    // Lose Scene
    gameState = 9;
  }
  
  if (fearValue >= 5) {
    imageMode(CORNER);
    // Lose Scene
    gameLost2 = true;
    return;
  }
  background(0); 
  imageMode(CORNER);
  image(lv2_bg, 0, 0);
  fill(0, 180);
  noStroke();
  rect(0, 0, width, 50);
  fill(0, 180);  
  noStroke();
  rect(0, (height-50), width, 50);
  boolean shouldLightUp = initialRevealCounter > 0 || mazeLit || countdown <= 5;
  int lightRadius = 1 + collectedLightBalls; 
  
  pushMatrix();
  translate(0, 50); // Adjust starting y-coordinate
  
  if (shouldLightUp) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j].show();
      }
    }
    if (initialRevealCounter > 0) {
      initialRevealCounter--;
    }
  } else {
    for (int i = max(0, player.x - lightRadius); i <= min(cols - 1, player.x + lightRadius); i++) {
      for (int j = max(0, player.y - lightRadius); j <= min(rows - 1, player.y + lightRadius); j++) {
        grid[i][j].show();
      }
    }
  }
  
  player.show();
  exitCell.showExit(); 
  for (Obstacle o : obstacles) {
    o.move();
    if (shouldLightUp || (abs(player.x - o.x) <= lightRadius && abs(player.y - o.y) <= lightRadius)) {
      o.show();
    }
    if (player.x == o.x && player.y == o.y && !isProtected) {
      fearValue++;
      isProtected = true;
      protectionCounter = 90; // 3 seconds protection at 30 fps
    }
  }
  if (isProtected) {
    protectionCounter--;
    if (protectionCounter <= 0) {
      isProtected = false;
    }
  }
  popMatrix();

  if (frameCount % 30 == 0) {
    countdown--;
  }
  frameCount++;

  if (countdown <= 0) {
    countdown = 60;
    generateMaze();
  }

  if (frameCount % 900 == 0) { 
    placeLightBalls();
  }

  fill(255);
  textSize(30);
  textAlign(CENTER, BASELINE);
  text("Light Balls: " + collectedLightBalls, width / 2, 35);
  textAlign(LEFT, BASELINE);
  text("Time: " + countdown, 10, 35);
  displayFearValue();

  if (mazeLit) {
    mazeLitCounter--;
    if (mazeLitCounter <= 0) {
      mazeLit = false;
    }
  }

  player.isWin();
}

void lv2keyPressed() {
  //clickSound.play();
  if (keyCode == UP) {
    
    player.move(0, -1);
  } else if (keyCode == DOWN) {
    player.move(0, 1);
  } else if (keyCode == LEFT) {
    player.move(-1, 0);
  } else if (keyCode == RIGHT) {
    player.move(1, 0);
  }
  checkLightBall();
}
