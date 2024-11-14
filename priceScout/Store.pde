// ROUGH STORE FUNCTION

class Store {
  float x, y, w, h;
  float price, rating, competition;
  
  Store(float x, float y, float w, float h) {
    this.x = x; // x position of the store
    this.y = y; // y position of the store
    this.w = w; // store's width
    this.h = h; // store's height
    this.price = random(50, 150); // Set random price
    this.rating = random(1, 5); // Set store ratings
    this.competition = random(1, 10); // Set store competition
  }
  
  void display() {
    noStroke();
    fill(220);
    rect(x, y, w, h);
  }
  
  PVector center() {
    return new PVector(x + w/2, y + h/2);
  }
  
  float calculateAttraction(float customerBudget) {
    return calculateAttractionPercentage(price, 150, rating, 5, competition, 10, customerBudget);
  }
}
