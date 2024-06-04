int frameSec4 = frameSec3 + 24*10;
void s4setup(){
  background(255);
}

void scene_4(){
  stroke(0); 
  strokeWeight(8);

  for (int i = 0; i < 10; i++) {
    float x1 = random(width);
    float y1 = random(height);
    float x2 = random(width);
    float y2 = random(height);
    
    if (frameCount % 2 == 0) {
      line(x1, 0, x2, height);
    } else {
      line(0, y1, width, y2);
    }
  }
  if( frameCount > (frameSec3 + 24*9) && frameCount < frameSec4 ){
    if (frameCount % 8 == 0) {
      background(0);
    } else {
      background(255);
    }
  }else if( frameCount >= 24 * 10){
    background(0);
  }
  //saveFrame("ESIMG20488/ET####.png");
}
