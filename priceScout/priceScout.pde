int numStores = 0;

void setup(){
  size(1200,700);
  frameRate( 2 );  
}

// x, y, width, height
void draw() {
  background(0,200,70);
  // Store Plots
  noStroke();
  fill(220);
  rect(50, 20, 300, 183);
  rect(50, 500, 300, 183);
  
  rect(455, 20, 300, 183);
  rect(455, 500, 300, 183);
  
  rect(850, 20, 300, 183);
  rect(850, 500, 300, 183); 
  
  // Road
  fill(100);
  rect(0, 300, 1200, 100);
  fill(230,200,0);
  rect(0, 345, 1200, 10);
}

  
