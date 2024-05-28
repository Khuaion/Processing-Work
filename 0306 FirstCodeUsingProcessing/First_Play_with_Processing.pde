void setup() //initialization => ONCE
{
  size(640, 360); // always in setup
  background(0); // sometimes may be in draw() => different codition
} // block of code => Something in open & close curly brackets

void draw() //over & over again => FOREVER
{
  //background(0);
  noStroke(); // noStroke() ; noFill()
  //fill(mouseX, mouseX - mouseY, mouseY, mouseY - 50);
  //// circle(320, 180, 100);
  //circle(mouseX, mouseY, mouseX/4);
  //noFill();
  //stroke(mouseX, mouseX - mouseY, mouseY, 60);
  //circle(mouseX+5, mouseY+15, mouseX/4);
  fill(random(255), random(255), random(255), random(80));
  circle(random(640), random(360), random(50));
  strokeWeight(3);
  stroke(random(255), random(255), random(255), random(40));
  line(random(640), random(360), random(640),random(360));
  // x, y also can use "width +-*/" or "Height +-*/"
  //fill(244, 155, 240, 100);
  fill(0, 0, 0, 10);
  circle(320, 180, random(500));
  circle(320, 180, random(500));
}

////variables / mouseX, mouseY => whatever pixel wherever the mouse
//// colorMode(RGB, 640, S60, 255)
void mousePressed()
{
  background(0);
}

// variables 
// 1. variables ADDRESS computer memory stored
// 2. creating own Variables => 
//      1. DECLARE THE Variables: type name
//         data type: int, float, string, ...
//      2. Initialize the variable => name = 
//      3. use
// 3. variables names
//      1. start with letter
//      2. no spaces("_" ok)
//      3. don't capitalize the first letter / lower
//      4. camelCase => capitalize the first letter of the second word
//      5. AVOID RESERVED WORDS
// 4. GLOBAL Variables => Before all things

//float circleX = 0;
//// println
//void mousePressed()
//{
//  circleX = 0;
//}
//void draw() //over & over again => FOREVER
//{
//  println(circleX);
//  background(0);
//  noStroke(); 
//  fill(255);
//  circle(circleX, 180, 50);
  
//  circleX = circleX + 1; // circle += 1; circleX++;
//}

// fuction call => backgroung()
// assignment operation => circleX = 100, CIRCLEx = corcleX+ 3
// random(0, 640); or random(f)


// Static mode => excute statements, line by line
// Dynamic mode => void setup & draw
// global variables
// increment / decrement operator => x++( "++" incremant), x--( "--" incremant)

// postfix => x++( excute -> x + 1 )
// prefix => ++y ( y + 1 => excute )

// % : remainder
