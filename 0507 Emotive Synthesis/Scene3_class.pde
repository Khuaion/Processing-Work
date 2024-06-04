class Star {
  //Variables
  float size, angle, distance, speed, xPos, yPos;
  color starColour;
  int SOMETHING = 5;
  
  //Constructor
  //void setup()
  Star(float x, float y) {
    distance = random(2, width);
    //radians(degree (0-360))
    angle = radians(random(360));
    speed = distance / 200 + random(0.1, 0.5);
    size = random(1);
    colorMode(HSB, 360);
    starColour = color(random(125, 200), random(255), random(50, 255));
  }

  //Actions

  void render() {
    angle += radians(speed);
    xPos = width/2 + sin(angle) * distance;
    yPos = height/2 + cos(angle) * distance;
    
    fill(starColour);
    noStroke();
    ellipse(xPos, yPos, size, size);
  }
}
