int numPeople = 10;
color red = color(255,0,0);

Store[] stores = new Store[6]; 
Person[] peoples = new Person[numPeople];

void setup() {
  size(1200, 700);
  frameRate(30);
  
  String[] storeNames = {"Store A", "Store B", "Store C", "Store D", "Store E", "Store F"};
  float[] ratings = {0, 0, 0, 0, 0, 0};
  float[] avgPrices = {10, 10, 10, 10, 10, 10};
  float[] competitions = {2.0, 1.5, 1.2, 1.0, 1.8, 1.3};
  float[] xPositions = {50, 50, 455, 455, 850, 850};
  float[] yPositions = {20, 500, 20, 500, 20, 500};
  
  for (int i = 0; i < stores.length; i++) {
    stores[i] = new Store(storeNames[i], ratings[i], avgPrices[i], competitions[i], xPositions[i], yPositions[i]);
  }
  
  for (int n = 0; n < numPeople; n++) {
    peoples[n] = new Person(-20,375, random(1,20), 100, red);
    peoples[n].chooseStore();
  }
}

void draw() {
  background(0, 200, 70);

  noStroke();
  fill(220);
  
  rect(50, 20, 300, 183);
  rect(50, 500, 300, 183);
  rect(455, 20, 300, 183);
  rect(455, 500, 300, 183);
  rect(850, 20, 300, 183);
  rect(850, 500, 300, 183); 
  
  background(0, 200, 70);
  
  fill(100);
  rect(0, 300, 1200, 100);
  fill(230, 200, 0);
  rect(0, 345, 1200, 10);
  
  fill(100);
  rect(160, 190, 80, 110);
  fill(230, 200, 0);
  rect(195, 190, 10, 110);
  
  fill(100);
  rect(565, 190, 80, 110);
  fill(230, 200, 0);
  rect(600, 190, 10, 110);
  
  fill(100);
  rect(960, 190, 80, 110);
  fill(230, 200, 0);
  rect(995, 190, 10, 110);
  
  fill(100);
  rect(160, 400, 80, 105);
  fill(230, 200, 0);
  rect(195, 400, 10, 105);
  
  fill(100);
  rect(565, 400, 80, 105);
  fill(230, 200, 0);
  rect(600, 400, 10, 105);
  
  fill(100);
  rect(960, 400, 80, 105);
  fill(230, 200, 0);
  rect(996, 400, 10, 105);
  
  for (Store store : stores) {
    store.display();
  }
  
  for (int n = 0; n < numPeople; n++) {
     peoples[n].drawme();
     peoples[n].update();
  }
}


void mouseClicked() {
  for (Store store : stores) {
    store.saleMade();
  }
}
