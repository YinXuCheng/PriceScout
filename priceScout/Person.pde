//class Person {
  
//  //FIELDS
//  PVector position; // the persons position
//  int speed; // the person speed
//  Float money; // the persons budget
//  color colour; // persons colour
//  int personWidth = 10; // width of a person
  
//  Store targetStore; // target store variable
//  boolean isInStore; // true or false statement
//  int storeEntryTime; // counts how long they are in the store so they leave after
  
//  // CONSTRUCTOR
//  Person(int x, int y, int s, float m, color c) { // initializing variables
//    this.position = new PVector(x, y);
//    this.speed = s;
//    this.money = m;
//    this.colour = c;
//    this.targetStore = null; // will be chosen later
//    this.isInStore = false; // the person walks from the road, so they will initially NOT be in a store
//    this.storeEntryTime = 0; // timer/counter always starts from 0
//  }
  
//  //METHODS
  
//  // Draw the person
//  void drawme() {
//    fill(colour);
//    circle(position.x, position.y, personWidth);
//  }
  
//  // Update the persons position and state
//  void update() {
//    if (isInStore) {
//      if (second() - storeEntryTime > 2) {
//        leaveStore();
//      }
//    } else if (targetStore != null) {  // if the target store is not not existing
//      moveOnRoad(); // first go to road then go to the store (people cant go through walls)
//      moveTowardsStore(); // move towards the store
//    } else {
//      moveOnRoad();  // move to road only
//    }
//  }
  
//  // Move along the road
//  void moveOnRoad() {
//    position.x += speed;
//    if (position.x > width + 50 || position.x < -50) {
//      chooseStore();
//    }
//  }
  
//  // Move towards the target store
//  void moveTowardsStore() {
//    if ((position.x - targetStore.center().x) < 1) { // if the persons "x" position is less than 1 (not towards the designated coordinate)
//      if ((position.y - targetStore.center().y) < 1) { // if the persons "y" position is less than 1 (not towards the designated coordinate)
//        enterStore(); // this sets that the person has successfully made it inside the store
//      } 
//      else {
//        if (targetStore.center().y > position.y) { // If the store is down, the person moves down by 1 pixel
//          position.y += 1;  // Move down
//        } 
//        else { // If the store is up, the person moves up by 1 pixel
//          position.y -= 1;  // Move up
//        }
//      }
//    }
//      if (targetStore.center().x > position.x) { // If the store is to the right, the person moves right by 1 pixel
//        position.x += 1;  // Move right
//      }     
//      else { // If the store is to the left, the person moves left by 1 pixel
//        position.x -= 1;  // Move left
//      }
//  }
  
//  // Enter a store
//  void enterStore() {
//    isInStore = true;
//    storeEntryTime = second();
//    position = targetStore.center().copy();
//  }
  
//  // Leave a store
//  void leaveStore() {
//    isInStore = false;
//    position.y = 350; // Back to road
//    chooseStore();
//  }
  
//  // Choose a store based on attraction
//  void chooseStore() {
//    targetStore = null;
//    for (Store store : stores) {
//      float attraction = store.calculateAttraction(money);
//      if (random(100) < attraction) {
//        targetStore = store;
//        break;
//      }
//    }
//  }
//}
