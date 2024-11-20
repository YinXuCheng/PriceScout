/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:251840:
  appc.background(230);
} //_CODE_:window1:251840:

public void amountOfPeopleChanged(GCustomSlider source, GEvent event) { //_CODE_:numPeoples:824157:
  int newNumPeople = numPeoples.getValueI();
  int currentNumPeople = peoples.size();

  if (newNumPeople > currentNumPeople) {
     for (int i = 0; i < newNumPeople - currentNumPeople; i++) {
         float speed = random(5, 10); 
         float money = random(10, 100); 
         color personColor = color(250, 10, 0);
      
         Person person = new Person(speed, money, personColor);
         person.chooseStore(); 
         peoples.add(person); 
       }
    } 
    
    else if (newNumPeople < currentNumPeople) {
        for (int i = 0; i < currentNumPeople - newNumPeople; i++) {
            peoples.remove(peoples.size() - 1);
        }
    }

} //_CODE_:numPeoples:824157:

public void speedValueChanged(GCustomSlider source, GEvent event) { //_CODE_:speedValue:603430:
  framePerSecond = speedValue.getValueI(); 
  frameRate(framePerSecond);
} //_CODE_:speedValue:603430:

public void storeValChanged(GCustomSlider source, GEvent event) { //_CODE_:storeNum:836312:
  numStores = storeNum.getValueI();
} //_CODE_:storeNum:836312:

public void custom_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider1:654194:
  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:custom_slider1:654194:

public void custom_slider2_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider2:334359:
  println("custom_slider2 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:custom_slider2:334359:

public void custom_slider3_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider3:262810:
  println("custom_slider3 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:custom_slider3:262810:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 700, 500, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  numPeoples = new GCustomSlider(window1, 22, 41, 100, 40, "grey_blue");
  numPeoples.setLimits(500, 1, 10000);
  numPeoples.setNbrTicks(200);
  numPeoples.setNumberFormat(G4P.INTEGER, 0);
  numPeoples.setOpaque(false);
  numPeoples.addEventHandler(this, "amountOfPeopleChanged");
  label1 = new GLabel(window1, 9, 12, 128, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Amount of People");
  label1.setOpaque(false);
  label6 = new GLabel(window1, 26, 110, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Speed Scale");
  label6.setOpaque(false);
  speedValue = new GCustomSlider(window1, 19, 143, 100, 40, "grey_blue");
  speedValue.setLimits(30, 15, 240);
  speedValue.setNbrTicks(60);
  speedValue.setNumberFormat(G4P.INTEGER, 0);
  speedValue.setOpaque(false);
  speedValue.addEventHandler(this, "speedValueChanged");
  label2 = new GLabel(window1, 26, 212, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Stores");
  label2.setOpaque(false);
  storeNum = new GCustomSlider(window1, 20, 244, 100, 40, "grey_blue");
  storeNum.setLimits(6, 1, 6);
  storeNum.setNbrTicks(6);
  storeNum.setNumberFormat(G4P.INTEGER, 0);
  storeNum.setOpaque(false);
  storeNum.addEventHandler(this, "storeValChanged");
  label3 = new GLabel(window1, 250, 12, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Ratings");
  label3.setOpaque(false);
  custom_slider1 = new GCustomSlider(window1, 240, 37, 100, 40, "grey_blue");
  custom_slider1.setLimits(0.5, 0.0, 1.0);
  custom_slider1.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider1.setOpaque(false);
  custom_slider1.addEventHandler(this, "custom_slider1_change1");
  label4 = new GLabel(window1, 241, 115, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Price");
  label4.setOpaque(false);
  custom_slider2 = new GCustomSlider(window1, 233, 137, 100, 40, "grey_blue");
  custom_slider2.setLimits(0.5, 0.0, 1.0);
  custom_slider2.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider2.setOpaque(false);
  custom_slider2.addEventHandler(this, "custom_slider2_change1");
  label5 = new GLabel(window1, 243, 212, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Competition");
  label5.setOpaque(false);
  custom_slider3 = new GCustomSlider(window1, 235, 243, 100, 40, "grey_blue");
  custom_slider3.setLimits(0.5, 0.0, 1.0);
  custom_slider3.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider3.setOpaque(false);
  custom_slider3.addEventHandler(this, "custom_slider3_change1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GCustomSlider numPeoples; 
GLabel label1; 
GLabel label6; 
GCustomSlider speedValue; 
GLabel label2; 
GCustomSlider storeNum; 
GLabel label3; 
GCustomSlider custom_slider1; 
GLabel label4; 
GCustomSlider custom_slider2; 
GLabel label5; 
GCustomSlider custom_slider3; 
