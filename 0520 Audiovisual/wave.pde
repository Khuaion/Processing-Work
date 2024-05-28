float x = 0;
float y = 0;
float num = 7;
float r = 50;

void wave(){
  for( int i = 0 ; i < num ; i ++){
    x = i * 100;
    noStroke();
    fill(midiPitch % 255, 50);
    for( int j = 0 ; j < num ; j ++){
      y = j * 100;
      circle( x, y, r );
    }
  }
  
  r++;
  r %= 150;
}
