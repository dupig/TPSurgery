class TPSurgery
{
  final int NUM_LEDS = 61;
  long fadeMillis = 0;
  color col[] = new color[NUM_LEDS];
  color fadeCol[] = new color[NUM_LEDS];
  boolean serialError = false;
  
  Serial port;
  
  Left left = new Left();
  Bottom bottom = new Bottom();
  Right right = new Right();
  Top top = new Top();
  Menu menu = new Menu();
  Hands hands = new Hands();
  
  TPSurgery(PApplet parent) {
    try{
      String portName = Serial.list()[0];
      println(portName);
      port = new Serial(parent, portName, 115200);
    }
    catch(Exception e) {
      serialError = true;
      println("Could not establish serial connection with TPS!");
      //stop();
    }
  }
  
  void update() {
    byte data[] = new byte[NUM_LEDS*3];
    for(int i=0; i<NUM_LEDS; i++) {
      data[i*3] = byte((col[i] >> 16 & 0xFF));
      data[i*3+1] = byte((col[i] >> 8 & 0xFF));
      data[i*3+2] = byte((col[i] & 0xFF));
    }
    if(!serialError) {
      port.write(1);
      port.write(data);
    }
    else println("Could not establish serial connection with TPS!");
  }
 
  void randomize() { for( int i=0; i<NUM_LEDS; i++) col[i] = color(random(255),random(255),random(255)); }
 
  void clear() { for( int i=0; i<NUM_LEDS; i++) { col[i] = 0;  fadeCol[i] = 0; } }
  
  void setLed(int led, color c) { if(0<=led && led<NUM_LEDS) { col[led] = c; fadeCol[led] = c; } }
  void addLed(int led, color c) { if(0<=led && led<NUM_LEDS) { blendColor(col[led], c, ADD); blendColor(fadeCol[led], c, ADD); } }
  void set(color c) { for( int i=0; i<NUM_LEDS; i++) setLed(i, c); }
  void add(color c) { for( int i=0; i<NUM_LEDS; i++) addLed(i, c); }
  
  void fadeLed(int led, color c) { fadeCol[led] = c; }
  void fade(color c) { for( int i=0; i<NUM_LEDS; i++) fadeLed(i, c); }  
  
  void fadeUpdate() {
    final int fadeSpeed = 2;
    for( int i=0; i<NUM_LEDS; i++) {
      if((fadeCol[i] >> 16 & 0xFF) > (col[i] >> 16 & 0xFF)) col[i] = color((col[i] >> 16 & 0xFF)+fadeSpeed, (col[i] >> 8 & 0xFF), (col[i] & 0xFF)); 
        else if((fadeCol[i] >> 16 & 0xFF) < (col[i] >> 16 & 0xFF)) col[i] = color((col[i] >> 16 & 0xFF)-fadeSpeed, (col[i] >> 8 & 0xFF), (col[i] & 0xFF)); 
      if((fadeCol[i] >> 8 & 0xFF) > (col[i] >> 8 & 0xFF)) col[i] = color((col[i] >> 16 & 0xFF), (col[i] >> 8 & 0xFF)+fadeSpeed, (col[i] & 0xFF));
        else if((fadeCol[i] >> 16 & 0xFF) < (col[i] >> 16 & 0xFF)) col[i] = color((col[i] >> 16 & 0xFF), (col[i] >> 8 & 0xFF)-fadeSpeed, (col[i] & 0xFF)); 
      if((fadeCol[i] & 0xFF) > (col[i] & 0xFF)) col[i] = color((col[i] >> 16 & 0xFF), (col[i] >> 8 & 0xFF), (col[i] & 0xFF)+fadeSpeed);
        else if((fadeCol[i] >> 16 & 0xFF) < (col[i] >> 16 & 0xFF)) col[i] = color((col[i] >> 16 & 0xFF), (col[i] >> 8 & 0xFF), (col[i] & 0xFF)-fadeSpeed); 
    }
  }
  
  class Left
  {
    final int OFFSET = 0;
    final int NUM_LEDS = 9;
    Left() { }
    
    void setLed(int led, color c) { TPSurgery.this.setLed(OFFSET+led, c); }
    void addLed(int led, color c) { TPSurgery.this.addLed(OFFSET+led, c); }
    void set(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.setLed(i, c); }
    void add(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.addLed(i, c); }
  }
  class Bottom
  {
    final int OFFSET = 9;
    final int NUM_LEDS = 20;
    Bottom() { }
    
    void setLed(int led, color c) { TPSurgery.this.setLed(OFFSET+led, c); }
    void addLed(int led, color c) { TPSurgery.this.addLed(OFFSET+led, c); }
    void set(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.setLed(i, c); }
    void add(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.addLed(i, c); }
  }
  class Right
  {
    final int OFFSET = 29;
    final int NUM_LEDS = 9;
    Right() { }
    
    void setLed(int led, color c) { TPSurgery.this.setLed(OFFSET+led, c); }
    void addLed(int led, color c) { TPSurgery.this.addLed(OFFSET+led, c); }
    void set(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.setLed(i, c); }
    void add(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.addLed(i, c); }
  }
  class Top
  {
    final int OFFSET = 38;
    final int NUM_LEDS = 20;
    Top() { }
    
    void setLed(int led, color c) { TPSurgery.this.setLed(OFFSET+led, c); }
    void addLed(int led, color c) { TPSurgery.this.addLed(OFFSET+led, c); }
    void set(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.setLed(i, c); }
    void add(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.addLed(i, c); }
  }
  class Menu
  {
    final int OFFSET = 58;
    final int NUM_LEDS = 1;
    Menu() { }
    
    void setLed(int led, color c) { TPSurgery.this.setLed(OFFSET+led, c); }
    void addLed(int led, color c) { TPSurgery.this.addLed(OFFSET+led, c); }
    void set(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.setLed(i, c); }
    void add(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.addLed(i, c); }
  }
  class Hands
  {
    final int OFFSET = 59;
    final int NUM_LEDS = 2;
    Hands() { }
    
    void setLed(int led, color c) { TPSurgery.this.setLed(OFFSET+led, c); }
    void addLed(int led, color c) { TPSurgery.this.addLed(OFFSET+led, c); }
    void set(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.setLed(i, c); }
    void add(color c) { for(int i=OFFSET; i<OFFSET+NUM_LEDS; i++) TPSurgery.this.addLed(i, c); }
  }
}