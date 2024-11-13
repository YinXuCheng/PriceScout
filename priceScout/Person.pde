class Person {
  
  //FIELDS
  PVector position;
  int speed;
  Float money;
  color colour;
  int personWidth = 10;
  
  // CONSTRUCTOR
  Person(int x, int y, int s, float m, color c) {
    this.position = new PVector(x, y);
    this.speed = s;
    this.money = m;
    this.colour = c;
  }
  
  //METHODS
  // Draw the person
  void drawme() {
    fill(colour);
    circle(position.x, position.y, personWidth);
  }
}
