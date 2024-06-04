class Wave {
  float x, y; 
  float radius;
  float speed;
  float alpha; 
  int createdAtFrame; 
  color col;
  
  Wave(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.radius = 0; 
    this.speed = speed;
    this.alpha = 255;
    this.createdAtFrame = frameCount; 
    this.col = color(255, 0, 0); 
  }

  void update() {
    
    int elapsedTime = frameCount - createdAtFrame;
    if (elapsedTime > 24* 10) { 
      col = color(0); 
    } else if (elapsedTime > 24*5) { 
      
      col = lerpColor(color(255, 0, 0), color(0), map(elapsedTime, 24*5, 24*7, 0, 1));
    }
    
    radius += speed;
    
    if (col != color(0)) {
      alpha -= 2;
      alpha = constrain(alpha, 0, 255);
    }
  }
  
  void display() {
    fill(col, alpha);
    noStroke();
    circle(x, y, radius * 2);
  }

  boolean isVisible() {
    return alpha > 0 || col != color(0);
  }
}
