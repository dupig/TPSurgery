boolean defaultHand = true; //default hand; true means right and false means left;
boolean defaultFlag= false;//true means default hand set
boolean timeFlag = true;

boolean flag_startHand_setting = false;
boolean flag_moveHand_setting = false;
float dist_Hand_setting = 0.0;
long time_startHand_setting = 0;
float duration_Hand_setting = 0;

final float time_Hand_Setting = 3000;// hand holded for 3 second to set it default


float angle_1 = 0;
float angle_2 = 0;

float led_blink_time = 0;
boolean led_flag_1 = false;
boolean led_flag_2 = false;



void defaultHandSetting()
  {


//functional part below
float hand_left_flag = 0;
float hand_right_flag = 0;
float k = 0;
    if(!defaultFlag)
  {
    if(leap.getHands()==null)
    {
     //led_flag_2=false;
     angle_1 = 0;
     angle_2 = 0;
     hand_left_flag = 0;
     hand_right_flag = 0;
     duration_Hand_setting=0;
  
   }
    println(leap.getHands());

  for (Hand handIn : leap.getHands ()) 
    {
      
    hand = handIn;
    PVector translation = hand.getPosition();
    long time_currentFrame = millis();
    
    //println(translation.z);
    if(hand.getRawPosition().z>threshold_z_min&&hand.getRawPosition().z<threshold_z_max&&hand.getRawPosition().x>threshold_x_min&&hand.getRawPosition().x<threshold_x_max&&hand.getRawPosition().y>threshold_y_min&&hand.getRawPosition().y<threshold_y_max){
    
    if(hand.isLeft())
    {hand_left_flag = 1;
     hand_right_flag = 0;
     angle_2 = 0;
     }
    else if(hand.isRight())
    {hand_left_flag = 0;
     hand_right_flag = 1;
     angle_1 = 0;    
     }
     
   
    if ( flag_startHand_setting ) {
      translation.sub( startHand_setting.getPosition() );
      dist_Hand_setting = translation.mag();
      
    }
    else dist_Hand_setting = 2 * dist_threshold;
    
    if ( dist_Hand_setting > dist_threshold ) {
      flag_startHand_setting = true;
      flag_moveHand_setting = true;
      startHand_setting = hand;
      time_startHand_setting = millis();
      duration_Hand_setting = 0;

    }
    else 
    {duration_Hand_setting = int(time_currentFrame - time_startHand_setting);
}
    k = duration_Hand_setting/time_Hand_Setting;
    if(duration_Hand_setting > time_Hand_Setting)
    { 
      if(hand.isRight()) defaultHand = true;
      if(hand.isLeft()) defaultHand = false;      
      defaultFlag = true;
      state = 1;
    }
    }
    

    }


  if(angle_1<PI) angle_1 += 0.01*hand_left_flag;
  else angle_1 = 0; 
  
  if(angle_2<PI) angle_2 += 0.01*hand_right_flag;
  else angle_2 = 0; 
  }
  
 //graphic part below

  float radius_1 = 300;  
  float radius_2 = 250;
  background(20);
  fill(255);
  textFont(myFont);
  textAlign(CENTER);
  textSize(50*resolution);
  text("PLEASE HOLD YOUR DEFAULT HAND ABOVE LEAPMOTION",width/2,150*resolution);
  stroke(b);
  strokeWeight(3);
  int xx = width/2;
  float yy = 150*resolution;
  line(xx-670*resolution,yy+20*resolution,xx-665*resolution,yy+20*resolution);
  line(xx-670*resolution,yy+20*resolution,xx-670*resolution,yy+15*resolution);
  line(xx-670*resolution,yy-50*resolution,xx-665*resolution,yy-50*resolution);
  line(xx-670*resolution,yy-50*resolution,xx-670*resolution,yy-45*resolution);
  line(xx+670*resolution,yy+20*resolution,xx+665*resolution,yy+20*resolution);
  line(xx+670*resolution,yy+20*resolution,xx+670*resolution,yy+15*resolution);
  line(xx+670*resolution,yy-50*resolution,xx+665*resolution,yy-50*resolution);
  line(xx+670*resolution,yy-50*resolution,xx+670*resolution,yy-45*resolution);
  pushMatrix();


//left circle
  for(int i = 0;i<=60;i++)
  { 
    noStroke();
    fill(b);
    ellipse(width/4+radius_1*sin(15*i/30.0*PI-angle_1*hand_left_flag)*resolution,height/2+radius_1*cos(15*i/30.0*PI-angle_1*hand_left_flag)*resolution,15*resolution,15*resolution);
    stroke(b);
    noFill();
    strokeWeight(3);
    ellipse(width/4+radius_1*sin(15*i/30.0*PI-angle_1*hand_left_flag)*resolution,height/2+radius_1*cos(15*i/30.0*PI-angle_1*hand_left_flag)*resolution,25*resolution,25*resolution);


  }
  arc(width/4,height/2,radius_1*2*resolution,radius_1*2*resolution, 0+angle_1*hand_left_flag,PI/2+angle_1*hand_left_flag);
  arc(width/4,height/2,radius_1*2*resolution,radius_1*2*resolution, PI+angle_1*hand_left_flag,3*PI/2+angle_1*hand_left_flag);
  
  if(hand_left_flag>0) stroke(b);
  else stroke(255);
  hand_left_icon(width/4-5*resolution,height/2-55*resolution,0.7);
  stroke(255);
  strokeWeight(1);
  noFill();
  ellipse(width/4,height/2,250*resolution,250*resolution);
  textFont(myFont);
  textSize(50*resolution);
  textMode(CENTER);
  fill(255);
  text(int(k*hand_left_flag*100),width/4,height/2+50*resolution);
  text("%",width/4,height/2+100*resolution);
  //translate(-50*k*hand_left_flag,-50*k*hand_left_flag,0);
  for(int i = 0; i<= 120*k*hand_left_flag;i++)
    {stroke(255);
    strokeWeight(1);
    line(width/4+(radius_2-100)*sin(-i/60.0*PI+PI)*resolution,height/2+(radius_2-100)*cos(-i/60.0*PI+PI)*resolution,width/4+(radius_2)*sin(-i/60.0*PI+PI)*resolution,height/2+(radius_2)*cos(-i/60.0*PI+PI)*resolution);
   
    }
    

   //translate(50*k*hand_left_flag,50*k*hand_left_flag,0);  

  
  
//right circle    
  for(int i = 0;i<=60;i++)
  { 
   noStroke();
   fill(b);
   ellipse(3*width/4+radius_1*sin(15*i/30.0*PI-angle_2*hand_right_flag)*resolution,height/2+radius_1*cos(15*i/30.0*PI-angle_2*hand_right_flag)*resolution,15*resolution,15*resolution);
   stroke(b);
   noFill();
   strokeWeight(3);
   ellipse(3*width/4+radius_1*sin(15*i/30.0*PI-angle_2*hand_right_flag)*resolution,height/2+radius_1*cos(15*i/30.0*PI-angle_2*hand_right_flag)*resolution,25*resolution,25*resolution);


  }
  arc(3*width/4,height/2,radius_1*2*resolution,radius_1*2*resolution, 0+angle_2*hand_right_flag,PI/2+angle_2*hand_right_flag);
  arc(3*width/4,height/2,radius_1*2*resolution,radius_1*2*resolution, PI+angle_2*hand_right_flag,3*PI/2+angle_2*hand_right_flag);
  stroke(255);
  strokeWeight(1);
  noFill();
  if(hand_right_flag>0) stroke(b);
  else stroke(255);
  hand_right_icon(3*width/4-5*resolution,height/2-55*resolution,0.7);
  stroke(255);
  strokeWeight(1);
  noFill();
  ellipse(3*width/4,height/2,250*resolution,250*resolution);
  textFont(myFont);
  textSize(50*resolution);
  textMode(CENTER);
  fill(255);
  text(int(k*hand_right_flag*100),3*width/4,height/2+50*resolution);
  text("%",3*width/4,height/2+100*resolution);
  //translate(-50*k*hand_left_flag,-50*k*hand_left_flag,0);
  for(int i = 0; i<= 120*k*hand_right_flag;i++)
   {stroke(255);
   strokeWeight(1);
   line(3*width/4+(radius_2-100)*sin(-i/60.0*PI+PI)*resolution,height/2+(radius_2-100)*cos(-i/60.0*PI+PI)*resolution,3*width/4+(radius_2)*sin(-i/60.0*PI+PI)*resolution,height/2+(radius_2)*cos(-i/60.0*PI+PI)*resolution);
      }
popMatrix();

  }

 
  
  