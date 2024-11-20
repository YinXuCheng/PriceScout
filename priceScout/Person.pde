class Person {
  // FIELDS
  PVector position;
  PVector velocity;
  PVector targetPosition;
  float money;
  color colour;
  int personWidth = 15;
  boolean movingRight;

  Store targetStore;
  boolean isInStore;
  int storeEntryTime;
  boolean isReturningToRoad;
  boolean returningVertically;
  
  // CONSTRUCTOR
  Person(float speed, float m, color c) {
    if (random(0, 1) > 0.5) {
      this.movingRight = true;
      this.position = new PVector(-50, 375);
      this.velocity = new PVector(speed, 0);
    } 
    
    else {
      this.movingRight = false;
      this.position = new PVector(width + 50, 325);
      this.velocity = new PVector(-speed, 0);
    }
    
    this.targetPosition = this.position.copy();
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
    circle(position.x, position.y, personWidth);
  }
  
  void update() {
    if (isInStore) {
      if (second() - storeEntryTime > 2) {
        leaveStore();
      }
    } 
    
    else if (isReturningToRoad) {
      returnToRoad();
    } 
    
    else if (targetStore != null) {
      PVector storeCenter = new PVector(targetStore.position.x + 150, targetStore.position.y + 91.5);
      
      if (abs(position.x - storeCenter.x) > 1) {
        moveOnRoad();
      } 
      
      else {
        moveTowardsStore(storeCenter);
      }
    } 
    
    else {
      moveOnRoad();
    }
  }

  void moveOnRoad() {
    position.add(velocity);
    
    // Set the target y-position based on direction
    targetPosition.y = movingRight ? 375 : 325; // 2 different values, one for moving right (below the line), one for moving left (above the line)
    
    // Smoothly adjust y-position towards the target
    position.y = lerp(position.y, targetPosition.y, 0.1);
    
    if (position.x > width + 50 || position.x < -50) {
      movingRight = !movingRight;
      if (movingRight) {
        position.x = -50;
        position.y = 375;
      }
      
      else {
        position.x = width + 50;
        position.y = 325;
      }
      
      velocity.x *= -1;
      chooseStore();
    }
  }

  void moveTowardsStore(PVector storeCenter) {
    if (targetStore.position.y <= 300) {
      PVector direction = PVector.sub(storeCenter, position);
      direction.normalize();
      direction.mult(abs(velocity.x));  // Use the same speed as on the road
      position.add(direction);
    }
    
    if (targetStore.position.y >= 300) {
      PVector direction = PVector.sub(storeCenter, position);
      direction.normalize();
      direction.mult(abs(velocity.x));  // Use the same speed as on the road
      position.add(direction);
    }
    
    if (PVector.dist(position, storeCenter) < 5) {
      enterStore();
    }
  }
  
  void enterStore() {
    isInStore = true;
    storeEntryTime = second();
    if (targetStore.position.y <= 300) {
      position.set(targetStore.position.x + 125, targetStore.position.y + 91.5);
    }
    
     else if (targetStore.position.y >= 300) {
      position.set(targetStore.position.x + 175, targetStore.position.y + 91.5);
     }
  }
  
  void leaveStore() {
    isInStore = false;
    isReturningToRoad = true;
    returningVertically = true;  // Start with vertical movement
    targetStore.saleMade();
    targetPosition.y = movingRight ? 375 : 325;
    targetPosition.x = position.x;  // Keep the same x position initially
  }

  void returnToRoad() {
    if (returningVertically) {
      // Move vertically first
      float dy = targetPosition.y - position.y;
      float moveY = min(abs(dy), abs(velocity.x)) * sign(dy);
      position.y += moveY;

      if (abs(position.y - targetPosition.y) < 1) {
        // Vertical movement complete, start horizontal movement
        returningVertically = false;
        targetPosition.x = movingRight ? width + 50 : -50;
      }
    }
    
    else {
      // Move horizontally
      float dx = targetPosition.x - position.x;
      float moveX = min(abs(dx), abs(velocity.x)) * sign(dx);
      position.x += moveX;

      if (abs(position.x - targetPosition.x) < 1) {
        // Horizontal movement complete, return to normal movement
        position.x = targetPosition.x;
        isReturningToRoad = false;
        chooseStore();
      }
    }
  }

  // Helper function to get the sign of a number
  float sign(float x) {
    return x > 0 ? 1 : (x < 0 ? -1 : 0);
  }
  
  void chooseStore() {
   float[] attractions = new float[stores.length];
   float totalAttraction = 0;
   
   for (int i = 0; i < numStores; i++) {
     attractions[i] = calculateAttractionPercentage(stores[i].avgPrice, maxPrice, stores[i].rating, maxRating, stores[i].competition, maxCompetition, this.money);
     totalAttraction += attractions[i];
   }
   
   if (totalAttraction > 0) {
     float randomValue = random(0, totalAttraction);
     float cumulativeAttraction = 0;
       for (int i = 0; i < stores.length; i++) {
          cumulativeAttraction += attractions[i];
          if (randomValue <= cumulativeAttraction) {
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
