class Cell {
  int i, j;
  boolean hasLightBall = false;
  boolean[] walls = {true, true, true, true};
  boolean visited = false;

  Cell(int i, int j) {
    this.i = i;
    this.j = j;
  }

  void show() {
    int x = i * w;
    int y = j * w;
    stroke(255);
    strokeWeight(0.5);
    if (walls[0]) line(x, y, x + w, y);
    if (walls[1]) line(x + w, y, x + w, y + w);
    if (walls[2]) line(x + w, y + w, x, y + w);
    if (walls[3]) line(x, y + w, x, y);

    if (hasLightBall) {
      fill(255, 255, 0);
      ellipse(x + w / 2, y + w / 2, w / 2, w / 2);
    }
  }

  void showExit() {
    int x = i * w;
    int y = j * w;
    fill(255, 0, 0);
    noStroke();
    ellipse(x + w / 2, y + w / 2, w / 2, w / 2);
  }

  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top = (j > 0) ? grid[i][j - 1] : null;
    Cell right = (i < cols - 1) ? grid[i + 1][j] : null;
    Cell bottom = (j < rows - 1) ? grid[i][j + 1] : null;
    Cell left = (i > 0) ? grid[i - 1][j] : null;

    if (top != null && !top.visited) {
      neighbors.add(top);
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int r = int(random(neighbors.size()));
      return neighbors.get(r);
    } else {
      return null;
    }
  }
}

void removeWalls(Cell a, Cell b) {
    int x = a.i - b.i;
    if (x == 1) {
      a.walls[3] = false;
      b.walls[1] = false;
    } else if (x == -1) {
      a.walls[1] = false;
      b.walls[3] = false;
    }
    int y = a.j - b.j;
    if (y == 1) {
      a.walls[0] = false;
      b.walls[2] = false;
    } else if (y == -1) {
      a.walls[2] = false;
      b.walls[0] = false;
    }
}

void generateMaze() {
  // Reset grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i, j);
    }
  }
  
  // Depth-first search algorithm for maze generation
  Cell current = grid[0][0];
  stack.add(current);

  while (!stack.isEmpty()) {
    current.visited = true;
    Cell next = current.checkNeighbors();
    if (next != null) {
      next.visited = true;
      stack.add(current);
      removeWalls(current, next);
      current = next;
    } else if (!stack.isEmpty()) {
      current = stack.remove(stack.size() - 1);
    }
  }

  placeLightBalls();
}
