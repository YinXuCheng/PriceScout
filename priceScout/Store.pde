class Store {
  String name;
  float rating, avgPrice, competition, revenue;
  PVector position = new PVector();  
  PImage storeImg;  

  // Constructor to initialize store properties and position
  Store(String name, float rating, float avgPrice, float competition, float x, float y) {
    this.name = name;
    this.rating = rating;
    this.avgPrice = avgPrice;
    this.competition = competition;
    this.revenue = 0;  
    this.position.x = x;
    this.position.y = y;
    this.storeImg = loadImage("store.png");  
  }

  void display() {
    image(this.storeImg, this.position.x, this.position.y);  
    
    fill(100);  
    textSize(15);

    if (this.position.y > 300) {
      text(this.name, this.position.x + 10, this.position.y - 20);  
      text("Revenue: $" + this.revenue, this.position.x + 10, this.position.y - 40);  
    } 
    
    else {
      text(this.name, this.position.x + 10, this.position.y + this.storeImg.height + 20);  
      text("Revenue: $" + this.revenue, this.position.x + 10, this.position.y + this.storeImg.height + 40);  
    }
  }
  

  void saleMade() {
    this.revenue += this.avgPrice;
  }
}
