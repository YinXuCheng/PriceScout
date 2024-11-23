import g4p_controls.*;

int storeSelected = 0; // Used for the text field
int numStores = 6; // Number of stores displayed on screen
int numPeople = 500; // Number of people displayed on screen
color red = color(255, 0, 0); // Color for the people
int framePerSecond = 30; // Determines how fast the animation runs
boolean isPaused = false; // Used for the pause and start button
float maxPrice = 1000; // Max price for each store used for formula
float maxRating = 5; // Max rating used for each store used for forumla
float maxCompetition = 2; // Max competiton used for formula
Store[] stores = new Store[6]; // Array with the store objects
ArrayList<Person> peoples; //Array list as people number changes

String[] storeNames = {"Store A", "Store B", "Store C", "Store D", "Store E", "Store F"}; //Store names
float[] ratings = {1, 1, 1, 1, 1, 1}; // Default rating
float[] avgPrices = {10, 10, 10, 10, 10, 10}; // Default prices
float[] competitions = {1, 1, 1, 1, 1, 1}; // Default competitions
float[] xPositions = {50, 50, 455, 455, 850, 850}; // Default starting positions
float[] yPositions = {20, 500, 20, 500, 20, 500};

void setup() {
  size(1200, 700);
  frameRate(framePerSecond);
 
  reset(); // Reset function called to initialze everything
  createGUI();
}

void reset(){
  peoples = new ArrayList<Person>(); // Initialze the person aray 
  
  
   for (int i = 0; i < stores.length; i++) { // Initialze the stores
    stores[i] = new Store(storeNames[i], ratings[i], avgPrices[i], competitions[i], xPositions[i], yPositions[i]);
  }

  for (int n = 0; n < numPeople; n++) { // Initialze the people 
    float speed = random(5, 10);  // Random speed
    float money = random(500, 2000);  // Random money between 500 and 1000
    color personColor = color(250, 10, 0);  // Red color
    
    Person person = new Person(speed, money, personColor);
    person.chooseStore(); // Choose store based on method 
    peoples.add(person); // Add person to array list
  }
}

void draw() {
  background(0, 200, 70);

  noStroke(); // Remove the borders
  fill(220); 

  rect(50, 20, 300, 183); // Draw the plots for the png to sit on
  rect(50, 500, 300, 183);
  rect(455, 20, 300, 183);
  rect(455, 500, 300, 183);
  rect(850, 20, 300, 183);
  rect(850, 500, 300, 183);

  background(0, 200, 70);
  
  fill(100);
  rect(0, 300, 1200, 100); // main road
  fill(230, 200, 0); // main road line

 // for loop to create dotted lines on the main road
  for (int x = 0; x < width; x += 20 + 20) {
    rect(x, 345, 20, 10);
  }

  fill(100); // Create the roads that branch off toward stores
  rect(160, 190, 80, 110);
  rect(565, 190, 80, 110);
  rect(960, 190, 80, 110);
  rect(160, 400, 80, 105);
  rect(565, 400, 80, 105);
  rect(960, 400, 80, 105);


  for (int i = 0; i < peoples.size(); i++) { // Iterate over the people array list and call methods to display them correctly
      Person person = peoples.get(i);
      person.drawme();
      person.update();
  }
  
  for (int x = 0; x < numStores; x++) { // Iterate over the store array and call methods to display them correctly
    stores[x].display();
  } 
}
