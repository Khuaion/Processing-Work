class Player {
  int x, y;

  Player(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void move(int dx, int dy) {
    int newX = x + dx;
    int newY = y + dy;
    if (newX >= 0 && newX < cols && newY >= 0 && newY < rows) {
      if (!grid[x][y].walls[2] && dy == 1 || !grid[x][y].walls[0] && dy == -1 || !grid[x][y].walls[3] && dx == -1 || !grid[x][y].walls[1] && dx == 1) {
        x = newX;
        y = newY;
      }
    }
  }

  void show() {
    imageMode(CENTER);
    image(playerRabbit, x * w  + w / 2, y * w + w / 2 , w , w );
    //fill(0, 0, 255);
    //noStroke();
    //ellipse(x * w + w / 2, y * w + w / 2, w / 2, w / 2);
  }
  
  void isWin() {
  // Check if player has reached the exit
    if (player.x == cols - 1 && player.y == rows - 1) {
      gameWon2 = true;
    }
  }
}
