import g4p_controls.*;

int numStores = 6;
int numPeople = 20;
color red = color(255, 0, 0);
int framePerSecond = 30;

float maxPrice = 100;
float maxRating = 5;
float maxCompetition = 2;

Store[] stores = new Store[6]; 
ArrayList<Person> peoples = new ArrayList<Person>();

void setup() {
  size(1200, 700);
  frameRate(framePerSecond);

  String[] storeNames = {"Store A", "Store B", "Store C", "Store D", "Store E", "Store F"};
  float[] ratings = {0, 0, 0, 0, 0, 0};
  float[] avgPrices = {10, 20, 15, 19, 16, 20};
  float[] competitions = {2.0, 1.5, 1.2, 1.0, 1.8, 1.3};
  float[] xPositions = {50, 50, 455, 455, 850, 850};
  float[] yPositions = {20, 500, 20, 500, 20, 500};


  for (int i = 0; i < stores.length; i++) {
    stores[i] = new Store(storeNames[i], ratings[i], avgPrices[i], competitions[i], xPositions[i], yPositions[i]);
  }

  for (int n = 0; n < numPeople; n++) {
    float speed = random(5, 10);  // Random speed
    float money = random(10, 100);  // Random money between 10 and 100
    color personColor = color(250, 10, 0);  // Random color
    
    Person person = new Person(speed, money, personColor);
    person.chooseStore();
    peoples.add(person);
  }
  
  createGUI();
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
  fill(230, 200, 0); // main road line

 // for loop to create dotted lines on the main road
  for (int x = 0; x < width; x += 20 + 20) {
    rect(x, 345, 20, 10);
  }


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

  for (int i = 0; i < peoples.size(); i++) {
      Person person = peoples.get(i);
      person.drawme();
      person.update();
  }
  
  for (int x = 0; x < numStores; x++) {
    stores[x].display();
  }

  
}
