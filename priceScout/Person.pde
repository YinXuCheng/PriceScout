class Person {
  // FIELDS
  PVector position; // position of the person
  PVector velocity; // velocity of the person
  PVector targetPosition; // target position to go to, the store
  float money; // amount of money the person has
  color colour; // colour of the person
  int personWidth = 15; // the size of each person
  boolean movingRight; // true/false checker to determine if person is moving right or left

  Store targetStore; // sets to target store
  boolean isInStore; // true/false statement to check if person is inside a store
  int storeEntryTime; // a timer to send people back out of the store after a certain amount of time
  boolean isReturningToRoad; // true/false statement to check if person is returning back to the road (changes y value)
  boolean returningVertically; // true/false statement to check if person moves back to the road vertically
  
  // CONSTRUCTOR
  Person(float speed, float m, color c) {
    if (random(0, 1) > 0.5) { // randomizer to determine if person will spawn and move right or left
      this.movingRight = true; // enables movingRight boolean value to be true (if person is moving right)
      this.position = new PVector(-50, 375); // person is moving right on the upper lane
      this.velocity = new PVector(speed, 0); // setting x-movement velocity to only move on the x-axis, following the road
    } 
    
    else {
      this.movingRight = false; // if the person is NOT moving right (they are moving left)
      this.position = new PVector(width + 50, 325); // person is moving left in the upper lane
      this.velocity = new PVector(-speed, 0); // setting x velocity to move to the left on x-axis
    }
    
    this.targetPosition = this.position.copy(); // copy's the position to set it's destination
    this.money = m; // stating the value of money
    this.colour = c; // stating the colour
    this.targetStore = null; // targetstore will initially be null because it will choose a store after it is created
    this.isInStore = false; // people spawn off screen on the road, not inside a store, so isinstore value will be false
    this.storeEntryTime = 0; // they have not spent any time at a store yet, so time spent in store is set to zero
    this.isReturningToRoad = false; // people are already on the road, so they dont have to return to it, so its set to false
  }
  
  // METHODS
  void drawme() { // draw the person function
    fill(colour); // fills in the colour of the person to the set colour
    circle(position.x, position.y, personWidth); // creates a circle (person)
  }
  
  void update() { // updates the person consistenly with if-statements to prevent people being stuck after following a method
    if (isInStore) { // if the person is inside a store
      if (second() - storeEntryTime > 2) { // if the person is inside a store for more than 2 seconds, they leave on the 3rd second
        leaveStore(); // this makes the person leave the store
      }
    } 
    
    else if (isReturningToRoad) { // if person is returning to road instead of being inside a store
      returnToRoad(); // this makes the person return back to the main road
    } 
    
    else if (targetStore != null) { // else if a person has chosen a store to go to
      PVector storeCenter = new PVector(targetStore.position.x + 150, targetStore.position.y + 91.5); // this is the position of the store it will go to
      
      if (abs(position.x - storeCenter.x) > 1) { // if the x value is not alligned with the store
        moveOnRoad(); // the person will continue to move in the same direction on the main road
      } 
      
      else { // if the x value of the store and person match
        moveTowardsStore(storeCenter); // person moves towards the store (no movement in x-axis, they only move on the y-axis)
      }
    } 
    
    else { // if a person has not chosen a store, it will remain to move off-screen (people don't ALWAYS go to a store to spend their hard earned money)
      moveOnRoad(); // person moves on the main road
    }
  }

  void moveOnRoad() { // method for person to move on road
    position.add(velocity);
    
    // Set the target y-position based on direction
    if (movingRight) {
      targetPosition.y = 375; // y-value keeps the person to the right of the road based on the direction its moving
    }
    else if (!movingRight) {
      targetPosition.y = 325; // y-value keeps the person to the right of the road based on the direction its moving
    }
    
    // Smoothly adjust y-position towards the target
    position.y = lerp(position.y, targetPosition.y, 0.1); // creating a smooth, linear movement using lerp (similar to a bezierPoint but without the curves, so its straight)
    
    if (position.x > width + 50 || position.x < -50) { // this line checks for people if they are moving either left or right to be 50 pixels to the right or vice versa 
      movingRight = !movingRight; // this changes the person's movingright value to be the opposite
      if (movingRight) { // if the person is moving right
        position.x = -50; // person's starting x position will be 50 pixels to the left off screen
        position.y = 375; // person's starting y position will be below the dotted lines
      }
      
      else { // if the person is not moving right (if they are moving left)
        position.x = width + 50; // person's starting x position will be 50 pixels to the right off screen
        position.y = 325; // person's starting y position will be above the dotted lines
      }
      
      velocity.x *= -1; // the x velocity will be nagative to make the person move to the left
      chooseStore(); // person chooses a store
    }
  }

  // Makes person move towards a selected store
  void moveTowardsStore(PVector storeCenter) { // determining the PVector value for the store
    if (targetStore.position.y <= 350) { // if the store is above 350 pixels
      PVector direction = PVector.sub(storeCenter, position); // subtract the storecenters value by the persons position
      direction.normalize(); // normalize the direction value to the length of 1 to prevent speed and velocity issues
      direction.mult(abs(velocity.x));  // Multiply the vector by person's x-velocity
      position.add(direction); // add the direction value to the position. this tells the person where to go on the x-axis
    }
    
    if (targetStore.position.y >= 350) { // if the store is below the 350 pixels
      PVector direction = PVector.sub(storeCenter, position); // subtract the storecenters value by the persons position
      direction.normalize(); // normalize the direction value to the length of 1 to prevent speed and velocity issues
      direction.mult(abs(velocity.x));  // Multiply the vector by person's x-velocity
      position.add(direction); // add the direction value to the position. this tells the person where to go on the x-axis
    }
    
    if (PVector.dist(position, storeCenter) < 5) { // if the distance between the person's y-position and store's center is less than 5 pixels (set to 5 pixels in case of slight missplacement errors).
    enterStore(); // run the enter store method
    }
  }
  
  // makes the person enter a store. now it will move on the y-axis only.
  void enterStore() {
    isInStore = true; // boolean value of being inside a store is assumes
    storeEntryTime = second(); // counting how long the person has been inside the store by seconds
    
    //if (targetStore.position.y <= 300) {
    //  position.set(targetStore.position.x + 175, targetStore.position.y + 91.5);
    //}
    
    // else if (targetStore.position.y >= 300) {
    //  position.set(targetStore.position.x + 125, targetStore.position.y + 91.5);
    // }
  }
  
  // these lines of code run IF the person leave's the store
  void leaveStore() {
    isInStore = false; // they are no longer inside the store, so its set to false
    isReturningToRoad = true; // they are returning to road, so it only moves with it's y-velocity
    returningVertically = true;  // Start with vertical movement
    targetStore.saleMade(); // a person will always go to a store if they make a transaction. this adds a salemade to the store they went to.
    if (movingRight) { // if the person is going to move right
      targetPosition.y = 375; // person has to go to this y-value to stay under the road line ///////
    }
    else if (!movingRight) { // if the person is not going to move right (if they are going to move left)
      targetPosition.y = 325; // person has to go to this y-value to stay above the road line
    }
    position.x = targetPosition.x;  // Keep the same x position initially /////////////
  }

  // person is returning to road
  void returnToRoad() { 
    if (returningVertically) { // ran every frame, so if they are still returning to the road vertically
      
      // Move vertically first
      float dy = targetPosition.y - position.y; // 
      float moveY = min(abs(dy), abs(velocity.x)) * sign(dy); // calculating the direction
      position.y += moveY; // changes the current y-position of the person to the y position it's supposed to move to

      if (abs(position.y - targetPosition.y) < 1) { // if the person's position - targetposition is less than 1 pixel (if they are alligned to the road)
        
        // Vertical movement complete, start horizontal movement
        returningVertically = false; // stop moving vertically
        if (movingRight) { // if the person is going to move right
          targetPosition.x = 50; // person will start moving right
        }
        else if (!movingRight) { // if the person is not going to the right (going to the left)
          targetPosition.x = -50; // person will start moving left
        }
      }
    }
    
    else { // once the y-axis are alligned with the person and the main road, they HAVE to move on the x-axis
      
      // Move horizontally
      float dx = targetPosition.x - position.x; // determines the distance between the targeted x position and the person's x position
      float moveX = min(abs(dx), abs(velocity.x)) * sign(dx); // calculating the direction
      position.x += moveX; // person's x-position will move in the x-axis after calculating the direction

      if (abs(position.x - targetPosition.x) < 1) { // if the person's position is less than 1 pixel away from the targeted road side position
        
        // Horizontal movement complete, return to normal movement
        position.x = targetPosition.x; // the position of the person becomes the position of the targeted position
        isReturningToRoad = false; // since they are moving on the x-axis and they are on the main road, this value becomes false
        chooseStore(); // chooses another store
      }
    }
  }

  // Helper function to get the sign of the number
  float sign(float x) {
  if (x >= 0) { // if x is greater than 0, it is positive
    return 1.0; //multiplies by 1
  } 
  else { //if (x < 0) { // if x is less than 0, it is negative
    return -1.0; // multiplies by -1
  } 

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
