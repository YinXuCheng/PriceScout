class Store {
  float x, y, w, h;
  float price, rating, competition;
  
  Store(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.price = random(50, 150);
    this.rating = random(1, 5);
    this.competition = random(1, 10);
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
