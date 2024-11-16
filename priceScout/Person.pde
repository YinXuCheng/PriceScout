class Person {
  // FIELDS
  float x; // x position
  float y; // y position
  float speed;
  float money;
  color colour;
  int personWidth = 15;
  boolean movingRight;

  Store targetStore;
  boolean isInStore;
  int storeEntryTime;
  boolean isReturningToRoad;
  
  // CONSTRUCTOR
  Person(float s, float m, color c) {
    if (random(0, 1) > 0.5) {
      this.movingRight = true;
      this.x = -50;
      this.y = 375;
      this.speed = s;
    } else {
      this.movingRight = false;
      this.x = width + 50;
      this.y = 325;
      this.speed = -s;
    }
    this.money = m;
    this.colour = c;
    this.targetStore = null;
    this.isInStore = false;
    this.storeEntryTime = 0;
    this.isReturningToRoad = false;
  }
  
  // METHODS
  void drawme() {
    fill(colour);
    circle(x, y, personWidth);
  }
  
  void update() {
    if (isInStore) {
      if (second() - storeEntryTime > 2) {
        leaveStore();
      }
    } else if (isReturningToRoad) {
      returnToRoad();
    } else if (targetStore != null) {
      float storeX = targetStore.position.x + 150;
      float storeY = targetStore.position.y + 91.5;
      
      if (abs(x - storeX) > 1) {
        moveOnRoad();
      } else {
        moveTowardsStore(storeX, storeY);
      }
    } else {
      moveOnRoad();
    }
  }

  void moveOnRoad() {
    x = x + speed;
    if (movingRight) {
      y = 375;
    } else {
      y = 325;
    }
    
    if (x > width + 50 || x < -50) {
      movingRight = !movingRight;
      if (movingRight) {
        x = -50;
        y = 375;
        speed = abs(speed);
      } else {
        x = width + 50;
        y = 325;
        speed = -abs(speed);
      }
      chooseStore();
    }
  }

  void moveTowardsStore(float storeX, float storeY) {
    if (abs(y - storeY) > 1) {
      if (storeY > y) {
        y = y + abs(speed);
      } else {
        y = y - abs(speed);
      }
    }
    
    if (dist(x, y, storeX, storeY) < 5) {
      enterStore();
    }
  }
  
  void enterStore() {
    isInStore = true;
    storeEntryTime = second();
    x = targetStore.position.x + 150;
    y = targetStore.position.y + 91.5;
  }
  
  void leaveStore() {
    isInStore = false;
    isReturningToRoad = true;
    targetStore.saleMade();
  }

  void returnToRoad() {
    float targetY;
    if (movingRight) {
      targetY = 375;
    } else {
      targetY = 325;
    }
    
    if (abs(y - targetY) > 1) {
      if (targetY > y) {
        y = y + abs(speed);
      } else {
        y = y - abs(speed);
      }
    } else {
      y = targetY;
      isReturningToRoad = false;
      chooseStore();
    }
  }
  
  void chooseStore() {
    targetStore = stores[int(random(stores.length))];
  }
}
