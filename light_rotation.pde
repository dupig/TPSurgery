float lightX = 0;
float lightY = 0;
float lightZ = 0;

//float defaultRoll = 0;
//float defaultPitch = 0;
//float defaultYaw = 0;

boolean rotate_activate = false;
long rotatetime,rotatetime2 = 0;
PVector last_dynamics, hand_origin_dynamics;


void light_rotation()
{
  
  boolean currentHand = true;
  background(20);
  grids();
  stroke(0);
  for (Hand handIn : leap.getHands ()) {
    hand = handIn;
    if(hand.getRawPosition().z>threshold_z_min&&hand.getRawPosition().z<threshold_z_max&&hand.getRawPosition().x>threshold_x_min&&hand.getRawPosition().x<threshold_x_max&&hand.getRawPosition().y>threshold_y_min&&hand.getRawPosition().y<threshold_y_max)
    {
    if( hand.isRight())currentHand = true;
    else if(hand.isLeft())currentHand = false;
    
   
    float pinch = hand.getPinchStrength();
    if(pinch>0.8 && !rotate_activate && currentHand==defaultHand) 
    { 
      hand_origin_dynamics = hand.getPosition();
      rotate_activate = true;
      rotatetime = millis();
    }
    else if(pinch < 0.8 && rotate_activate && currentHand==defaultHand)
    {
     rotate_activate = false;
     last_dynamics = hand.getPosition();
     rotatetime2 = millis();
    }
    if(rotate_activate&& currentHand==defaultHand)
    {
      PVector dynamics = hand.getPosition();
      float newX = dynamics.x - hand_origin_dynamics.x;
      float newY = dynamics.y - hand_origin_dynamics.y;
      float newZ = dynamics.z - hand_origin_dynamics.z;
      map(newX, threshold_x_min-threshold_x_max, threshold_x_max-threshold_x_min, -60, 60);
      map(newY, threshold_y_min-threshold_y_max, threshold_y_max-threshold_y_min, -60, 60);
      map(newZ, threshold_z_min-threshold_z_max, threshold_z_max-threshold_z_min, -60, 60);
      lightX = -newX/5.0 + last_dynamics.x;
      lightY = newY/5.0 + last_dynamics.y;
      lightZ = newZ*2.0 + last_dynamics.z;
      if(lightX > 60) lightX = 60;
      else if(lightX < -60) lightX = -60;
      if(lightZ > 60) lightZ = 60;
      else if(lightZ < -60) lightZ = -60;
    }
    else if(!rotate_activate)
    {
      last_dynamics = hand.getPosition();
      last_dynamics.x = lightX;
      last_dynamics.y = lightY;
      last_dynamics.z = lightZ;
    }
    
   if(hand.getRoll()<-80&&currentHand==defaultHand)
       {
       lightX = 0;
       lightY = 0;
       lightZ = 0;

       rotate_activate = false;
       }  
  
  }
}




  //pushMatrix();
 
  //{
  //  if(millis()-rotatetime<3000) fill(61,143,188);
  //  else fill(150,255,255);
   if(rotate_activate) {
   if(light_animation<1)  light_animation+=0.01;
   else light_animation = 0;
   }
  
  
  
  ////roll and pitch control the position (and the angle)
  ////yaw is the brightness of light
  
  
  //float radius_1 = 150;
  //float angle_1 = 0;
  //float angle_2 = 0;
  
  //translate(width/2,height/4);
  if(lightX>-60&&lightX<60) angle_1 = lightX*PI/180;
  else if(lightX<=-60) 
  {angle_1 = -PI/3;}
  else if(lightX>=60)
  {angle_1 = PI/3;}
  
  if(lightZ>-60&&lightZ<60) angle_2 = lightZ*PI/180;
  else if(lightZ<=-60) 
  {angle_2 = -PI/3;}
  else if(lightZ>=60)
  {angle_2 = PI/3;}

  if(rotate_activate)   fill(b);
  else fill(255);
  ellipse(width*0.7+sin(angle_1)*250*resolution+50*sin(-light_animation*2*PI)*resolution,height/2+sin(angle_2)*250*resolution+50*cos(-light_animation*2*PI)*resolution,10*resolution,10*resolution);
  ellipse(width*0.7+sin(angle_1)*250*resolution+70*sin(light_animation*2*PI)*resolution,height/2+sin(angle_2)*250*resolution+70*cos(light_animation*2*PI)*resolution,10*resolution,10*resolution);
  ellipse(width*0.7+sin(angle_1)*250*resolution,height/2+sin(angle_2)*250*resolution,50*resolution,50*resolution);
  noFill();
  strokeWeight(2);
  if(rotate_activate)   stroke(b,100);
  else stroke(255,100);
  ellipse(width*0.7+sin(angle_1)*250*resolution,height/2+sin(angle_2)*250*resolution,160*resolution,160*resolution);
  arc(width*0.7+sin(angle_1)*250*resolution,height/2+sin(angle_2)*250*resolution,100*resolution,100*resolution,light_animation*2*PI,light_animation*2*PI+PI/2);
  arc(width*0.7+sin(angle_1)*250*resolution,height/2+sin(angle_2)*250*resolution,140*resolution,140*resolution,-light_animation*2*PI+PI/2,-light_animation*2*PI+PI);
  light_round_bg(width*0.7,height/2,500);
  rect_bar(150*resolution,100*resolution,0.35,7,"POWER");
  rect_bar(150*resolution,150*resolution,0.35,4,"LIQUID");
  rect_bar(150*resolution,200*resolution,0.35,5,"NARCOTIC");
  angle_radar(150*resolution,400*resolution,225*resolution,angle_1/PI*180,"angle1");
  angle_radar(425*resolution,400*resolution,225*resolution,angle_2/PI*180,"angle2");
  menu();
}