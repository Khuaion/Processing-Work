color[] fillColor; 
color boxColorKey;
int selectedColorIndex = -1;
int startTime;
int totalTime = 30000; // 30 seconds

String[] equations;
int[] answers;
boolean[] answeredCorrectly;
color[] boxColors;
boolean gameWon = false;
boolean gameLost = false;
String errorMessage = "";
int errorStartTime;

int[][] boxes; 

void lv1Setup(){
  //size(800, 800);
  fillColor = new color[8];
  for( int i = 0 ; i < 8 ; i++ ){
    fillColor[i] = color(random(255), random(255), random(255));
  }
  
  playerR.loop();
  
  startTime = millis();
  
  generateEquations();
  generateBoxes(); 
  selectedColorIndex = -1;
}

void lv1Draw(){
  image(lv1_bg, 0, 0, width, height);
  window();
  drawColorCircles();
  drawEquations();
  drawTimer();
  drawErrorMessage();
  
  if (gameWon) {
    // lv1 Game Won State
    gameState = 12;
    lv1_s2_startTime = millis(); // Start timer for lv2_s1
    lv1_s2.play(); // Start playing the GIF
    //gameState = 5;
  } else if (gameLost) {
    // Lose State
    gameState = 4;
  }
}

void drawColorCircles(){
  for(int i = 0; i < 8; i++){
    int x = 90 + (i % 2) * 70;
    int y = 320 + (i / 2) * 75;

    if (i == selectedColorIndex) {
      stroke(0);
    } else if (dist(mouseX, mouseY, x, y) <= 25) {
      stroke(0);
    } else {
      stroke(255); 
    }
    
    fill(fillColor[i]);
    strokeWeight(5);
    ellipse(x, y, 50, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(i + 1, x, y);
  }
}

void lv1MousePressed(){
  clickSound.play();
  if (gameWon || gameLost) return;

  for (int i = 0; i < 8; i++) {
    int x = 90 + (i % 2) * 70;
    int y = 320 + (i / 2) * 75;
    if (dist(mouseX, mouseY, x, y) <= 25) {
      boxColorKey = fillColor[i];
      selectedColorIndex = i;
      break;
    }
  }

  for (int i = 0; i < answers.length; i++) {
    int x = boxes[i][0];
    int y = boxes[i][1];
    int w = boxes[i][2];
    int h = boxes[i][3];
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (answers[i] == selectedColorIndex + 1) {
        answeredCorrectly[i] = true;
        boxColors[i] = boxColorKey;
        checkWinCondition();
      } else {
        errorMessage = "You Are Wrong!";
        errorStartTime = millis();
      }
    }
  }
}

void lv1keyPressed(){
  int keyIndex = keyCode - 49; 
  if (keyIndex >= 0 && keyIndex < 8) {
    boxColorKey = fillColor[keyIndex];
    selectedColorIndex = keyIndex;
  }
}

void window(){
  // Timer Box
  fill(255, 120);
  stroke(0, 100);
  strokeWeight(5);
  rect(250, 115, 500, 50);
  
  image(playerR, 50, 115, 150, 150);
  
  // Color Box
  fill(255, 120);
  stroke(0, 100);
  strokeWeight(5);
  rect(50, 285, 150, 300);
  
  // box paint background
  fill(255,220);
  noStroke();
  rect(250, 185, 500, 400);
}

void generateEquations(){
  equations = new String[15];
  answers = new int[15];
  answeredCorrectly = new boolean[15];
  boxColors = new color[15];

  for (int i = 0; i < 15; i++) {
    int a, b, result;
    int op;
    do {
      a = int(random(1, 9));
      b = int(random(1, 9));
      op = int(random(3)); // 0: +, 1: -, 2: *
      switch (op) {
        case 0:
          result = a + b;
          break;
        case 1:
          result = a - b;
          break;
        case 2:
          result = a * b;
          break;
        default:
          result = -1;
      }
    } while (result < 1 || result > 8);
    switch (op) {
      case 0:
        equations[i] = a + " + " + b ;
        answers[i] = a + b;
        break;
      case 1:
        equations[i] = a + " - " + b ;
        answers[i] = a - b;
        break;
      case 2:
        equations[i] = a + " * " + b ;
        answers[i] = a * b;
        break;
    }
  }
}

void generateBoxes() {
  boxes = new int[15][4]; // x, y, w, h
  int startX = 250;
  int startY = 185;
  int endX = 750;
  int endY = 585;
  
  boxes[0][0] = startX;
  boxes[0][1] = startY;
  boxes[0][2] = endX - startX;
  boxes[0][3] = endY - startY;
  
  int numBoxes = 1;
  while (numBoxes < 15) {
    int idx = int(random(numBoxes));
    int x = boxes[idx][0];
    int y = boxes[idx][1];
    int w = boxes[idx][2];
    int h = boxes[idx][3];
    
    boolean horizontal = random(1) > 0.5;
    if (horizontal && h > 120) {
      int split = int(random(60, h - 60));
      boxes[idx][3] = split;
      boxes[numBoxes][0] = x;
      boxes[numBoxes][1] = y + split;
      boxes[numBoxes][2] = w;
      boxes[numBoxes][3] = h - split;
      numBoxes++;
    } else if (!horizontal && w > 120) {
      int split = int(random(60, w - 60));
      boxes[idx][2] = split;
      boxes[numBoxes][0] = x + split;
      boxes[numBoxes][1] = y;
      boxes[numBoxes][2] = w - split;
      boxes[numBoxes][3] = h;
      numBoxes++;
    }
  }
}

void drawEquations(){
  for (int i = 0; i < boxes.length; i++) {
    int x = boxes[i][0];
    int y = boxes[i][1];
    int w = boxes[i][2];
    int h = boxes[i][3];
    
    fill(255);
    stroke(0);
    rect(x, y, w, h);

    if (i < equations.length) {
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(min(20, w / (equations[i].length() / 2)));
      text(equations[i], x + w / 2, y + h / 2);
    }

    if (answeredCorrectly[i] && i < boxColors.length) {
      fill(boxColors[i]);
      noStroke();
      rect(x, y, w, h);
    }
  }
}

void drawTimer(){
  int elapsedTime = millis() - startTime; // Calculate the elapsed time
  int remainingTime = totalTime - elapsedTime; // Calculate the remaining time
  
  if (remainingTime > 0) {
    int minutes = remainingTime / 60000;
    int seconds = (remainingTime % 60000) / 1000;
    String timerText = nf(minutes, 2) + ":" + nf(seconds, 2);
    textSize(32);
    fill(0);
    text(timerText, 490, 140);
  } else {
    textSize(32);
    fill(0);
    text("00:00", 490, 140);
    gameLost = true;
  }
}

void drawErrorMessage() {
  if (millis() - errorStartTime < 1000 && !errorMessage.equals("")) {
    textSize(32);
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    text(errorMessage, width / 2, 700); 
  } else {
    errorMessage = "";
  }
}

void checkWinCondition(){
  for (int i = 0; i < answeredCorrectly.length; i++) {
    if (!answeredCorrectly[i]) return;
  }
  gameWon = true;
}
