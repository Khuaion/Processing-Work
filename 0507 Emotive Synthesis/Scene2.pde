// 46 ~ 75 / (75 ~ 135)
// anxious
int frameSec2 = 60 * 24; // frameSec2 = 135 * 24
int num = 2500;
Walker[] walkers;

void scene_2(){
  // Screen fade
  //background(0);
  blendMode(BLEND);
  fill(0, 100);
  rect(0, 0, width, height);
  
  // Execute draw() of Walker class
  blendMode(ADD);
  for (int i = 0; i < num; i++) {
    walkers[i].draw();
  }
  if( frameCount == frameSec2){
    background(0);
  }
  
}

// Walker class
class Walker {
  PVector position;
  color col;
  float size;
  float rotationAngle;
  float rotationSpeed;

  Walker() {
    // Set initial position to screen center
    position = new PVector(width / 2, height / 2);
    col = color(random(150, 255), random(100, 200), random(50, 150), random(50, 150));
    size = random(1, 8);
    rotationAngle = random(TWO_PI); // Random initial angle for rotational movement
    rotationSpeed = random(0.005, 0.02); // Random rotation speed
  }

  void draw() {
    // Random velocity in up, down, left, right directions
    PVector velocity = PVector.fromAngle(rotationAngle); // Use polar coordinates for rotational movement
    velocity.mult(random(0.5, 2)); // Adjust the speed
    // Update position
    position.add(velocity);
    
    // Update color (to create a gradient effect)
    colorMode(HSB, 360);
    col = color(random(-60, 60), random(255), random(50, 200));
    //col = color(red(col), green(col), blue(col), random(50, 150));
    
    // Draw circle
    noStroke();
    fill(col);
    ellipse(position.x, position.y, size, size);

    // Update rotation angle
    rotationAngle += rotationSpeed;
  }
  
}
