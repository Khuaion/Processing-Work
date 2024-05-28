void randomLine(){
  stroke(0); 
  strokeWeight(1);

  for (int i = 0; i < 20; i++) {
    float x1 = random(width);
    float y1 = random(height);
    float x2 = random(width);
    float y2 = random(height);
    line(x1, 0, x2, height);
    line(0, y1, width, y2);
  }
}
