// 76 ~ 105 / (75 ~ 135)
// accompany & Lonely
int frameSec3 = 75 * 24; // frameSec2 = 185 * 24
int a = 20;
int STAR_CLUSTERS = 5; 
int STARS_PER_CLUSTER = 1500;
Star centerStar;
//ArrayList
ArrayList<ArrayList<Star>> starClusters = new ArrayList<ArrayList<Star>>();
//ArrayList<Star> stars = new ArrayList();

//Array
//int[]
//int STARS_AMOUNT = 100;

void scene_3(){
  //fill(r,g,b,alpha)
  if( frameCount == frameSec2 + 1 ){
    fill(0);
    rect(0, 0, width, height);
    background(0);
  }
  
  fill(0, 20);
  rect(0,0, width, height);
  
  for (ArrayList<Star> cluster : starClusters) {
    for (Star star : cluster) {
      star.render();
    }
  }
 
  if(frameCount > 71 * 24){
    fill(255, a);
    rect(0, 0, width, height);
    a++;
  }
}
