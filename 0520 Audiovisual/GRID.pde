int gridSize = 10;
int cols, rows;
PVector[][] grid;
ArrayList<PVector> circles;
ArrayList<Float> circleRadii;
int numCircles = 0;
int maxCircles = 500;
int initialCircles = 20; 
int incrementCircles = 10;

void grid(){
  //background(0);  // Set the background to black

  // Incrementally add circles
  if (numCircles < maxCircles && frameCount % 60 == 0) {  // 每秒根據需要新增圓圈
    for (int j = 0; j < incrementCircles && numCircles < maxCircles; j++) {
      int cx = (int) random(cols) * gridSize;
      int cy = (int) random(rows) * gridSize;
      circles.add(new PVector(cx, cy));
      circleRadii.add(random(20, 50));
      numCircles++;
    }
  }

  // Update circle radii
  for (int i = 0; i < numCircles; i++) {
    circleRadii.set(i, 30 + 20 * sin(frameCount * 0.05 + i));
  }

  // Update grid deformation
  PVector[][] newGrid = new PVector[cols][rows];
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      newGrid[x][y] = new PVector(x * gridSize, y * gridSize);
      for (int i = 0; i < numCircles; i++) {
        float d = PVector.dist(newGrid[x][y], circles.get(i));
        if (d < circleRadii.get(i)) {
          float offset = map(d, 0, circleRadii.get(i), circleRadii.get(i), 0);
          newGrid[x][y].add(PVector.sub(newGrid[x][y], circles.get(i)).setMag(offset));
        }
      }
    }
  }
  //stroke(255);
  stroke(127); // Set the line color to white
  // Draw deformed grid
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (x < cols - 1 && !isInsideCircle(newGrid[x][y], newGrid[x + 1][y])) {
        line(newGrid[x][y].x, newGrid[x][y].y, newGrid[x + 1][y].x, newGrid[x + 1][y].y);
      }
      if (y < rows - 1 && !isInsideCircle(newGrid[x][y], newGrid[x][y + 1])) {
        line(newGrid[x][y].x, newGrid[x][y].y, newGrid[x][y + 1].x, newGrid[x][y + 1].y);
      }
    }
  }

  // Draw circles without stroke
  noStroke();
  noFill();  // Set circle color to red
  for (int i = 0; i < numCircles; i++) {
    ellipse(circles.get(i).x, circles.get(i).y, circleRadii.get(i) * 2, circleRadii.get(i) * 2);
  }
}

boolean isInsideCircle(PVector start, PVector end) {
  for (int i = 0; i < numCircles; i++) {
    if (start.dist(circles.get(i)) < circleRadii.get(i) || end.dist(circles.get(i)) < circleRadii.get(i)) {
      return true;
    }
  }
  return false;
}
