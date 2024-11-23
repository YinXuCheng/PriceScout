class Store {
  // Fields
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
    // Draw the store image
    image(this.storeImg, this.position.x, this.position.y);
    
    // Set text properties
    fill(0);  
    textSize(15);
    
    float textX = this.position.x + 200;  // X-position for the text
    float textY;  // Y-position for the text

    // Adjust Y-position based on whether the store is on the top or bottom
    if (this.position.y > 300) {
      textY = this.position.y - 80; // Position above the store
    } 
    
    else {
      textY = this.position.y + this.storeImg.height + 10; // Position below the store
    }
    
    // Display the store's information
    text(this.name, textX, textY);
    text("Revenue: $" + this.revenue, textX, textY + 20);  
    text("Price: $" + this.avgPrice, textX, textY + 40);  
    text("Rating: " + this.rating, textX, textY + 60);  
    text("Competition: " + this.competition, textX, textY + 80);  
  }

  // Track revenue when a sale is made
  void saleMade() { 
    this.revenue += this.avgPrice;
  }
}
