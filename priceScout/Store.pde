class Store {
  String name;
  float rating, avgPrice, competition, revenue;
  float x, y;  
  PImage storeImg;  

  // Constructor to initialize store properties and position
  Store(String name, float rating, float avgPrice, float competition, float x, float y) {
    this.name = name;
    this.rating = rating;
    this.avgPrice = avgPrice;
    this.competition = competition;
    this.revenue = 0;  
    this.x = x;
    this.y = y;
    this.storeImg = loadImage("store.png");  
  }

  void display() {
    image(this.storeImg, this.x, this.y);  
    
    fill(100);  
    textSize(15);

    if (this.y > 300) {
      text(this.name, this.x + 10, this.y - 20);  
      text("Revenue: $" + this.revenue, this.x + 10, this.y - 40);  
    } 
    
    else {
      text(this.name, this.x + 10, this.y + this.storeImg.height + 20);  
      text("Revenue: $" + this.revenue, this.x + 10, this.y + this.storeImg.height + 40);  
    }
  }


  void saleMade() {
    this.revenue += this.avgPrice;
  }
}
