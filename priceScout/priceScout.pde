int numStores = 6; // WILL BE CHANGED LATER FOR GUI COMPATIBILITY

void setup(){
  size(1200,700);
  frameRate(30);  
}

// x, y, width, height
// Create stores 
// WILL BE CHANGED LATER FOR GUI COMPATIBILITY
  stores.add(new Store(50, 20, 300, 183));
  stores.add(new Store(50, 500, 300, 183));
  stores.add(new Store(455, 20, 300, 183));
  stores.add(new Store(455, 500, 300, 183));
  stores.add(new Store(850, 20, 300, 183));
  stores.add(new Store(850, 500, 300, 183));
}

void draw() {
  background(0, 200, 70);
  
  // Draw stores
  for (Store store : stores) {  // WILL BE CHANGED LATER FOR GUI COMPATIBILITY
    store.display();
  }
  
  // Road
  fill(100);
  rect(0, 300, 1200, 100);
  fill(230,200,0);
  rect(0, 345, 1200, 10);
}
