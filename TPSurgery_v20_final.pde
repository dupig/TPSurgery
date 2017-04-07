import de.voidplus.leapmotion.*;
import processing.serial.*; //import the serial library for Processing

//setup
final boolean snapback = false;
final color red = color(255,0,0);
final color blue = color(0,0,255);
final color green = color(0,255,0);
float resolution = 1366.0/1920.0;
color b = color(61,143,188);
color rr = color(250,75,75);

//threshold for pause detection
float dist_threshold = 100;//distance for threshold in mm
int time_threshold = 100;  //time for threshold in ms


int state = 1;//the flow of working

TPSurgery tps;
LeapMotion leap;
Hand startHand, hand,  startHand_setting;

PFont myFont;
float cameraAngle = 0;
float light_animation = 0;
int pointNum, pointNum2 = 0;
Model humanBody;
Model lung;
ArrayList<Model> models = new ArrayList<Model>();
//according to the leap motion interaction box range from API, inside this box it's guarantee to detect the hand, unit is mm
float threshold_x_min = -119.5; //-117.5;
float threshold_x_max = 119.5; //117.5;
float threshold_y_min = 82.5;
float threshold_y_max = 317.5;
float threshold_z_min = -73.5;
float threshold_z_max = 73.5;

boolean default_hand_hold = false;//a variable to show whether the default hand is holding. Maybe need time

boolean led_flag_4 = false;

void setup() {
  size(1280,720,P3D);
  //fullScreen(P3D);
  background(225);

  noCursor();
  myFont = createFont("HelveticaNeueLTPro-Th", 32);
  leap = new LeapMotion(this);
  String modelName1 = String.format("humanBody.ply");
  String modelName2 = String.format("lung.ply");
  modelName1 = this.sketchPath(modelName1);
  modelName2 = this.sketchPath(modelName2);
  humanBody = Model.createModel(modelName1);
  lung = Model.createModel(modelName2);

  tps = new TPSurgery(this);
  //play around with the framerate
  frameRate(50);
  tps.set(color(255));
  tps.update();
}

void draw() {
  grids();
  if(state == 0) 
  {defaultHandSetting();
  tps.update();}
  if(state != 0) 
  {if(led_flag_4 == false)
  {
  tps.top.set(b);
  tps.left.set(b);
  tps.right.set(b);
  tps.bottom.set(b);
  led_flag_4 = true;}
  }
  if(state!=0&&!leap.isConnected()) state = 1;
  if(state == 1)
  {infoMapping();
   tps.update();
  }
  else if(state == 2) 
  {light_rotation();
   }
  showhand();
  tps.update();
}