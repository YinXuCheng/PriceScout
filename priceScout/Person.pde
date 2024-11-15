class Person {
  
  //FIELDS
  PVector position; // the persons position
  float speed; // the person speed
  Float money; // the persons budget
  color colour; // persons colour
  int personWidth = 15; // width of a person
  
  Store targetStore; // target store variable
  boolean isInStore; // true or false statement
  int storeEntryTime; // counts how long they are in the store so they leave after
  
  // CONSTRUCTOR
  Person(int x, int y, float s, float m, color c) { // initializing variables
    this.position = new PVector(x, y);
    this.speed = s;
    this.money = m;
    this.colour = c;
    this.targetStore = null; // will be chosen later
    this.isInStore = false; // the person walks from the road, so they will initially NOT be in a store
    this.storeEntryTime = 0; // timer/counter always starts from 0
  }
  
  //METHODS
  
  // Draw the person
  void drawme() {
    fill(colour);
    circle(position.x, position.y, personWidth);
  }
  
  // Update the persons position and state
  void update() {
    if (isInStore) {
      if (second() - storeEntryTime > 2) {
        leaveStore();
      }
    } else if (targetStore != null) {  // if the target store is not not existing
      moveOnRoad(); // first go to road then go to the store (people cant go through walls)
      moveTowardsStore(); // move towards the store
    } else {
      moveOnRoad();  // move to road only
    }
  }
  
  // Move along the road
  void moveOnRoad() {
    position.x += speed;
    if (position.x > width + 50 || position.x < -50) {
      chooseStore();
    }
  }
  
  // Move towards the target store
  void moveTowardsStore() {
    PVector storeCenter = new PVector(targetStore.position.x + 150, targetStore.position.y + 91.5);
    PVector direction = PVector.sub(storeCenter, position);
    direction.normalize();
    direction.mult(speed);
    position.add(direction);
    
    if (PVector.dist(position, storeCenter) < 5) {
      enterStore();
    }
  }
  
  // Enter a store
  void enterStore() {
    isInStore = true;
    storeEntryTime = second();
    position = new PVector(targetStore.position.x + 150, targetStore.position.y + 91.5);
  }
  
  // Leave a store
  void leaveStore() {
    isInStore = false;
    position.y = 350; // Back to road
    targetStore.saleMade();
    chooseStore();
  }
  
  // Choose a store based on attraction
  void chooseStore() {
    targetStore = null;
    float[] attractions = new float[6];
    float totalAttraction = 0;
    
    // Calculate attraction for each store
    for (int i = 0; i < 6; i++) {
      attractions[i] = calculateAttractionPercentage(stores[i].avgPrice, 20, stores[i].rating, 5, stores[i].competition, 2, money);
      totalAttraction += attractions[i];
    }
    
    // Choose a store based on weighted probabilities
    if (totalAttraction > 0) {
      float randomValue = random(totalAttraction);
      float sum = 0;
      for (int i = 0; i < 6; i++) {
        sum += attractions[i];
        if (randomValue <= sum) {
          targetStore = stores[i];
          break;
        }
      }
    }
    
    // If no store was chosen (all attractions were 0), choose a random store
    if (targetStore == null) {
      targetStore = stores[int(random(6))];
    }
  }
}
