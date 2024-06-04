class Particle {
  float x, y;
  color cc;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.cc = cols[int(random(cols.length))];
  }

  void move(PVector vector) {
    this.x += vector.x * random(0.5, 1.5);
    this.y += vector.y * random(0.5, 1.5);
  }

  void reset() {
    this.x = random(-512, width);
    this.y = random(-512, height);
  }
}
