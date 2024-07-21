void placeLightBalls() {
  // Clear existing light balls
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].hasLightBall = false;
    }
  }

  // Randomly place 8 light balls in the maze
  for (int n = 0; n < 8; n++) {
    int i = int(random(cols));
    int j = int(random(rows));
    grid[i][j].hasLightBall = true;
  }
}

void checkLightBall() {
  // Check if player is on a cell with a light ball
  if (grid[player.x][player.y].hasLightBall) {
    grid[player.x][player.y].hasLightBall = false;
    collectedLightBalls++;
    lightBalls++;
    if (lightBalls >= 5) {
      mazeLit = true;
      mazeLitCounter = 150; // 5 seconds at 30 fps
      lightBalls = 0;
      collectedLightBalls = 0; 
    }
  }
}
