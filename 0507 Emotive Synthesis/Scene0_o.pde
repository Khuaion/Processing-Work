// 0 ~ 15 ( 0 ~ 25 )
int frameSec0 = 15 * 24; // frameSec0 = 25 * 24
void scene_0(){
  noStroke();
  fill(random(255),random(255) );
  //rect(random(width), random(height), random(200), random(200));
  if( frameCount <= 5 * 24 ){
    if( frameCount % 4 == 0 ){
        rect(random(width), random(height), random(200), random(200));
    }
  }else if( frameCount > 5 * 24 && frameCount <= 8 * 24 ){
    if( frameCount % 2 == 0 ){
        rect(random(width), random(height), random(200), random(200));
    }
  }else if( frameCount > 8 * 24 && frameCount <= 14 * 24 ){
        rect(random(width), random(height), random(200), random(200));
  }else if( frameCount > 14 * 24 && frameCount <=frameSec0 ){
    if( frameCount % 4 == 0 ){
      background(255);
    }else{
      background(0);
    }
  }
}
