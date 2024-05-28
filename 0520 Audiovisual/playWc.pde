void play() //over & over again => FOREVER
{
  noStroke();
  fill(random(255), random(255), random(255), random(80));
  circle(random(width), random(width), random(50));
  strokeWeight(3);
  stroke(random(255), random(255), random(255), random(80));
  line(random(width), random(width), random(width),random(width));
  fill(0, 0, 0, 30);
  circle(width/2, width/2, random(500));
  circle(width/2, width/2, random(500));
}
