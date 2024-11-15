class Store{
  
 String name;
 float rating, avgPrice, competition;
 
 Store(String n, float r, float aP, float c){
  this.name = n;
  this.rating = r;
  this.avgPrice = aP;
  this.competition = c;
  
  // this supposed to go in store class or helper functions?
  //this.price = random(50, 150); // WILL BE CHANGED LATER FOR GUI COMPATIBILITY
  //this.rating = random(1, 5); // WILL BE CHANGED LATER FOR GUI COMPATIBILITY
  //this.competition = random(1, 10); // WILL BE CHANGED LATER FOR GUI COMPATIBILITY
 }
  
}

//plot 1 coords: square(20, 20, 200);
