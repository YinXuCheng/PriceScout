Store[] stores = new Store[6]; 

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
}

void draw() {
  background(0, 200, 70);
  
  fill(100);
  rect(0, 300, 1200, 100);
  fill(230, 200, 0);
  rect(0, 345, 1200, 10);
  
  for (Store store : stores) {
    store.display();
  }
}


void mouseClicked() {
  for (Store store : stores) {
    store.saleMade();
  }
}
