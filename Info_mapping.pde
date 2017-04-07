float modelX = 1300*resolution;
float modelY = 2*resolution;
float modelZ = 550*resolution;
float adjustment_humanBody_X = 0;
float adjustment_humanBody_Y = 0;
float adjustment_humanBody_Z = 150;
float adjustment_lung_X = -5;
float adjustment_lung_Y = 5;
float adjustment_lung_Z = -25;
float adjustment_humanBody_size = 4.8;
float adjustment_lung_size = 1.8;


float defaultX = 1300*resolution;
float defaultY = 2*resolution;
float defaultZ = 550*resolution;
boolean activate = false;

boolean flag_startHand_setting_info = false;
boolean flag_moveHand_setting_info = false;
float dist_Hand_setting_info = 0.0;
long time_startHand_setting_info = 0;
int duration_Hand_setting_info= 0;
PVector model_last_position, hand_origin_position;

void infoMapping()
  {  

   background(20);
   grids();
   boolean currentHand = true;
   for (Hand handIn : leap.getHands ()) 
    {
    hand = handIn;
    if(hand.getRawPosition().z>threshold_z_min&&hand.getRawPosition().z<threshold_z_max&&hand.getRawPosition().x>threshold_x_min&&hand.getRawPosition().x<threshold_x_max&&hand.getRawPosition().y>threshold_y_min&&hand.getRawPosition().y<threshold_y_max)
    {
    if( hand.isRight())currentHand = true;
    else if(hand.isLeft())currentHand = false;
    
    float pinch = hand.getPinchStrength();
    if(pinch > 0.8 && !activate)
    { hand_origin_position = hand.getRawPosition();//?
      activate = true;
      }
    else if(pinch > 0.8 && activate)
    {if (currentHand==defaultHand&&model_last_position!=null)
       { PVector translation = hand.getRawPosition();
         float newX = translation.x-hand_origin_position.x;
         float newY = translation.y-hand_origin_position.y;
         float newZ = translation.z-hand_origin_position.z;
         map(newX, threshold_x_min-threshold_x_max, threshold_x_max-threshold_x_min, -300, 300);
         map(newY, threshold_y_min-threshold_y_max, threshold_y_max-threshold_y_min, -1, 1);
         map(newZ, threshold_z_min-threshold_z_max, threshold_z_max-threshold_z_min, -300, 300);
         //modelX = (translation.x-hand_origin_position.x) + model_last_position.x;
         //modelY = (translation.y-hand_origin_position.y) + model_last_position.y;
         //modelZ = (translation.z-hand_origin_position.z)/50+ + model_last_position.z;
         modelX = newX*3.0 + model_last_position.x;
         modelY = newY/100.0 + model_last_position.y;
         modelZ = newZ*3.0 + model_last_position.z;
         if(modelY<0.5) modelY = 0.5;
         else if(modelY>4) modelY = 4;
       }
       
    
    }
    else if(pinch<=0.8)
    { activate = false;
      model_last_position = hand.getRawPosition();//only for initializing the PVector
      model_last_position.x = modelX;
      model_last_position.y = modelY;
      model_last_position.z = modelZ;
    }
    if(hand.getRoll()<-80&&currentHand==defaultHand)
       {
       modelX = defaultX;
       modelY = defaultY;
       modelZ = defaultZ;
       }
   
 }
 
 else
 { 
   float pinch = hand.getPinchStrength();
   activate = false;
   if(pinch>0.8&& snapback)
   {
      modelX = model_last_position.x;
      modelY = model_last_position.y;
      modelZ = model_last_position.z;
   }
 
 }
 

  }


    pushMatrix();
    translate(modelX,modelZ);
    scale(modelY);
    strokeWeight(1);
    stroke(b);
    noFill();
    ellipse(0,-20,380,380);
    strokeWeight(1);
    arc(0,-20,300,300,PI/2-cameraAngle/2,9*PI/6-cameraAngle/2);
    strokeWeight(2);
    arc(0,-20,420,420,0+cameraAngle/3,PI+cameraAngle/3);
    arc(0,-20,350,350,PI/3-cameraAngle/2,2*PI/3-cameraAngle/2);
    strokeWeight(5);
    stroke(b);
    arc(0,-20,450,450,PI/6+cameraAngle,3*PI/6+cameraAngle);
    rotateX(PI/2);
    translate(0,0,10-120*sin(cameraAngle+PI/6));
    circle_dots(0,0,40,0.2);
    translate(0,0,10+120*sin(cameraAngle+PI/6));
    translate(0,0,-60*cos(cameraAngle));
    circle_dots(0,0,50,0.4);
    translate(0,0,60*cos(cameraAngle));
    translate(0,0,-100*cos(2*cameraAngle));
    circle_dots(0,0,45,0.3);
    translate(0,0,100*cos(2*cameraAngle));
    translate(0,0,-90*sin(cameraAngle-PI/6));
    circle_dots(0,0,40,0.2);
    translate(0,0,90*sin(cameraAngle-PI/6));
    translate(0,0,-110*sin(cameraAngle));
    circle_dots(0,0,50,0.3);
    translate(0,0,110*sin(cameraAngle));
    translate(0,0,10-120*cos(2*cameraAngle));
    circle_dots(0,0,45,0.4);
    translate(0,0,10+120*cos(2*cameraAngle));
    rotateZ(cameraAngle);
    cancer(10,0,40);
    cancer(-13,0,45);
    noFill();
    if(activate) stroke(b,150);
    else if(!activate) stroke(255,150);
    strokeWeight(0.3);
    beginShape(TRIANGLES);
    for (int j = 0; j < humanBody.faces.length; ++j) {
       Face face = humanBody.faces[j];
       vertex(face.p1.x*adjustment_humanBody_size-adjustment_humanBody_X, face.p1.y*adjustment_humanBody_size-adjustment_humanBody_Y, face.p1.z*adjustment_humanBody_size-adjustment_humanBody_Z);
       vertex(face.p2.x*adjustment_humanBody_size-adjustment_humanBody_X, face.p2.y*adjustment_humanBody_size-adjustment_humanBody_Y, face.p2.z*adjustment_humanBody_size-adjustment_humanBody_Z);
       vertex(face.p3.x*adjustment_humanBody_size-adjustment_humanBody_X, face.p3.y*adjustment_humanBody_size-adjustment_humanBody_Y, face.p3.z*adjustment_humanBody_size-adjustment_humanBody_Z);
     }
   endShape();
    if(activate) stroke(255,150);
    else if(!activate) stroke(b,150);
    beginShape(TRIANGLES);
    for (int j = 0; j < lung.faces.length; ++j) {
       Face face = lung.faces[j];
       vertex(face.p1.x*adjustment_lung_size-adjustment_lung_X, face.p1.y*adjustment_lung_size-adjustment_lung_Y, face.p1.z*adjustment_lung_size-adjustment_lung_Z);
       vertex(face.p2.x*adjustment_lung_size-adjustment_lung_X, face.p2.y*adjustment_lung_size-adjustment_lung_Y, face.p2.z*adjustment_lung_size-adjustment_lung_Z);
       vertex(face.p3.x*adjustment_lung_size-adjustment_lung_X, face.p3.y*adjustment_lung_size-adjustment_lung_Y, face.p3.z*adjustment_lung_size-adjustment_lung_Z);
     }
   endShape();
   popMatrix();
   cameraAngle+=0.01;
   rectMode(CORNER);
   menu();
   rect_effect(100*resolution, 50*resolution, "Heartbeat",b,1,10,0);
   rect_effect(100*resolution, 120*resolution, "Compound",b,0.5,56,1);
   rect_effect(100*resolution, 190*resolution, "Protein_A",b,0.4,20,2);
   rect_effect(100*resolution, 260*resolution, "Protein_D",b,0.6,4,3);
   rect_effect(100*resolution, 330*resolution, "Lymphocyte",b,2,-20,4);
   rect_effect(310*resolution, 50*resolution, "Pressure",b,0.7,-3,5);
   rect_effect(310*resolution, 120*resolution, "Myoglobin",b,0.8,-10,6);
   rect_effect(310*resolution, 190*resolution, "Platelet",b,0.2,5,7);
   rect_effect(310*resolution, 260*resolution, "Erythrocyte",b,1.5,20,8);
   rect_effect(310*resolution, 330*resolution, "Leukocyte",b,0.9,-5,9);
   breath_curve(305*resolution,460*resolution,b);
   breath_curve_2(305*resolution,610*resolution,b);
   bars(550*resolution,175*resolution,b);
   bars_2(500*resolution,175*resolution,b);
  }


void grids()
{    
  translate(0,0,-1);
  for(int i = 0; i <= width/20; i++) 
    {stroke(255,50);
     strokeWeight(0.3);
     line(20*i,0,20*i,height);
    }
   for(int i = 0; i <= height/20; i++) 
    {stroke(255,50);
     strokeWeight(0.3);
     line(0,20*i,width,20*i);
    }

  translate(0,0,1);


}



void cancer(float x, float y, float z)
{   translate(x,y,z);
    fill(rr);
    noStroke();
    sphere(sin(cameraAngle*3)+1);
    translate(-x,-y,-z);
}