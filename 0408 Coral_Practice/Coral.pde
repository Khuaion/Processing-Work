int np = 40000; // Reduced particle count
Particle[] particles;
float ns = 0.08;
color[] cols = {#cacfe3, #838bb2, #e4a99b, #ce8467};
int niter = 8 * 60;
color colFl = #fc766a;
int startBurnFrame = 24 * 5; // Approx 10 seconds at 24fps
float burnAlpha = 0;
float burnRate = 255.0 / ((24 * 60) - startBurnFrame);
int endBlueFrame = 24 * 5; 
int endRedFrame = 24 * 10; 
int endBlackFrame = 24 * 15; 

//ArrayList<Wave> waves = new ArrayList<Wave>();

void setup() {
  size(512,512);
  frameRate(24); // Set to 24 frames per second
  colorMode(HSB, 360, 100, 100);
  //background(200, 80, 80);
  particles = new Particle[np];
  for (int i = 0; i < np; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
  stroke(255);
  strokeWeight(1);
}

void draw() {
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  for (int i = 0; i < np; i++) {
    Particle p = particles[i];
    stroke(p.cc);
    strokeWeight(random(1, 3));
    point(p.x, p.y);
    float n = noise(p.x * ns, p.y * ns, frameCount * ns);

    PVector vector = PVector.fromAngle(-PI * n);
    p.move(vector);

    if (!onScreen(p) && frameCount < 1000) {
      p.reset();
    }
  }

  
  if (frameCount >= startBurnFrame) {
    //waves.add(new Wave(random(width), random(height), 0.5));
    fill(0, random(255));
    noStroke();
    for( int i = 0 ; i < 1000 ; i++ ){
      circle(random(width), random(height), random(100));
    }
  }else if(frameCount >= startBurnFrame + 24*2) {
    fill(0);
    noStroke();
    rect(0, 0, width, height);
  }
}

boolean onScreen(Particle p) {
  return p.x > 0 && p.x < width && p.y > 0 && p.y < height;
}
