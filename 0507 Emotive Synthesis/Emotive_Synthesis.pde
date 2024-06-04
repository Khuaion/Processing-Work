// global Variables
//int frameASec = 24 * 120; // frameASec = 24 * 200;
int scene;
void setup(){
  size(512, 512);
  background(0);
  frameRate(24);
  //Scene1
  cols = (width + gridSize) / gridSize;
  rows = (height + gridSize) / gridSize;
  grid = new PVector[cols][rows];

  // Initialize grid points
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      grid[x][y] = new PVector(x * gridSize, y * gridSize);
    }
  }

  circles = new ArrayList<PVector>();
  circleRadii = new ArrayList<Float>();

  // Create initial circles
  for (int i = 0; i < initialCircles; i++) {
    int cx = (int) random(cols) * gridSize;
    int cy = (int) random(rows) * gridSize;
    circles.add(new PVector(cx, cy));
    circleRadii.add(random(20, 50));
  }
  numCircles = initialCircles;
  //Scene 2
  walkers = new Walker[num];
  
  // Instantiate Walker class
  for (int i = 0; i < num; i++) {
    walkers[i] = new Walker();
  }
  //Scene 3
  for (int i = 0; i < STAR_CLUSTERS; i++) {
    ArrayList<Star> cluster = new ArrayList<Star>(); 
    
    float clusterX = random(width); 
    float clusterY = random(height);
    
    for (int j = 0; j < STARS_PER_CLUSTER; j++) {
      cluster.add(new Star(clusterX, clusterY));
    }
    starClusters.add(cluster); 
  }
}

void draw(){
   if( frameCount <= frameSec0 ){
    scene = 0;
  }else if( frameCount > frameSec0 && frameCount <= frameSec1 ){
    scene = 1;
  }else if( frameCount > frameSec1 && frameCount <= frameSec2 ){
    scene = 2;
  }else if( frameCount > frameSec2 && frameCount < frameSec3 ){
    scene = 3;
  }else if( frameCount == frameSec3 ){
    s4setup();
  }else if( frameCount > frameSec3 && frameCount <= frameSec4 ){
    scene = 4;
  }
  
  switch(scene){
    case 0:
      scene_0();
      break;
    case 1:
      scene_1();
      break;
    case 2:
      scene_2();
      break;
    case 3:
      scene_3();
      break;
    case 4:
      scene_4();
      break;
  }
  //saveFrame("ESIMG_S2048/ES####.png");
}
