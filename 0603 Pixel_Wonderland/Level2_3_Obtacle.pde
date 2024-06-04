class Obstacle {
  int x, y;
  int direction;
  PImage img1, img2;
  boolean toggle;
  
  Obstacle(int x, int y) {
    this.x = x;
    this.y = y;
    direction = int(random(4));
    img1 = obstacle1;
    img2 = obstacle2;
    toggle = false;
  }
  
  void move() {
    if (frameCount % 30 == 0) { // Move every second
      toggle = !toggle;
      int dx = 0, dy = 0;
      switch (direction) {
        case 0:
          dy = -1; // Move up
          break;
        case 1:
          dy = 1; // Move down
          break;
        case 2:
          dx = -1; // Move left
          break;
        case 3:
          dx = 1; // Move right
          break;
      }
      int newX = x + dx;
      int newY = y + dy;
      if (newX >= 0 && newX < cols && newY >= 0 && newY < rows) {
        x = newX;
        y = newY;
      } else {
        direction = int(random(4)); // Change direction if hitting wall
      }
    }
  }
  
  void show() {
    imageMode(CENTER);
    if (toggle) {
      image(img1, x * w + w / 2, y * w + w / 2, w, w);
    } else {
      image(img2, x * w + w / 2, y * w + w / 2, w, w);
    }
  }
}

void displayFearValue() {
  int boxWidth = 20;
  int boxHeight = 30;
  int gap = 5;
  for (int i = 0; i < 5; i++) {
    if (i < fearValue) {
      fill(0);
    } else {
      fill(255);
    }
    rect(width - (i + 1) * (boxWidth + gap), 10, boxWidth, boxHeight);
  }
}
