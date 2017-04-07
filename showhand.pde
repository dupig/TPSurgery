boolean led_flag_3 = false;
//leave some questions about left hand and right hand?//

void showhand()
{   
    for (Hand handIn : leap.getHands ()) { 
    hand = handIn;      
    if(defaultFlag)
   {
     if(hand.isLeft()) 
    {if(defaultHand==false) 
    {tps.hands.setLed(0,color(255)); 
      tps.hands.setLed(1,color(0)); } 
     else if(defaultHand)   
     {tps.hands.setLed(0,color(255,0,0)); 
      tps.hands.setLed(1,color(0)); }
       tps.update();
}
    
    if(hand.isRight()) 
    {if(defaultHand) 
        {tps.hands.setLed(1,color(255)); 
      tps.hands.setLed(0,color(0)); } 
     else if(defaultHand==false)      
     {tps.hands.setLed(1,color(255,0,0)); 
      tps.hands.setLed(0,color(0)); }
       tps.update();
}
    if(hand.isRight()==false) tps.hands.setLed(1,color(0)); 
      tps.update();
    if(hand.isLeft()==false) tps.hands.setLed(0,color(0)); 
      tps.update();
   }
   else if(defaultFlag == false)
   {if(hand.isLeft()) tps.hands.setLed(0,color(255)); 
    else if(hand.isLeft()==false) tps.hands.setLed(0,color(0)); 
    
    if(hand.isRight()) tps.hands.setLed(1,color(255));
    else if(hand.isRight()==false) tps.hands.setLed(1,color(0)); 
    
    }
  
    if(hand.getRawPosition().z>threshold_z_min&&hand.getRawPosition().z<threshold_z_max&&hand.getRawPosition().x>threshold_x_min&&hand.getRawPosition().x<threshold_x_max&&hand.getRawPosition().y>threshold_y_min&&hand.getRawPosition().y<threshold_y_max){
    PVector location = hand.getRawPosition();
    float pinch = hand.getPinchStrength();
    noStroke();
    if(pinch>0.8) fill(255,100+150*pinch);
    else fill(61,143,188,100+150*pinch);
    ellipse(map(location.x,threshold_x_min, threshold_x_max, 0, width), map(location.z,threshold_z_min, threshold_z_max, 0, height), 20+30*pinch,20+30*pinch);//map(location.x,threshold_x_min, threshold_x_max, 0, width)
    tps.top.set(b);
    tps.left.set(b);
    tps.right.set(b);
    tps.bottom.set(b);
    tps.update();
}
    else 
    {
      color rrColor;
     rrColor = color(255*abs(sin(millis()/314.0)),0,0);
     fill(rr,100*abs(sin(millis()/314.0)));
     noStroke();
     rectMode(CORNER);
     tps.top.set(b);
    tps.left.set(b);
    tps.right.set(b);
    tps.bottom.set(b);
     if(hand.getRawPosition().z<threshold_z_min)  
     { rect(0,0,width,30);
       tps.top.set(rrColor);}
     else if(hand.getRawPosition().z>threshold_z_max)  
     { rect(0,height-30,width,30);
       tps.bottom.set(rrColor);}
     if(hand.getRawPosition().x<threshold_x_min)
     {rect(0,0,30,height);
      tps.left.set(rrColor);}
     else if(hand.getRawPosition().x>threshold_x_max)     
     {rect(width-30,0,30,height);
      tps.right.set(rrColor);}
     if(hand.getRawPosition().y<threshold_y_min||hand.getRawPosition().y>threshold_y_max)
     {rect(0,height-30,width,30);
      rect(0,0,width,30);
      rect(0,0,30,height);
      rect(width-30,0,30,height);
      tps.top.set(rrColor);
      tps.bottom.set(rrColor);
      tps.left.set(rrColor);
      tps.right.set(rrColor);
     }
 
     fill(rr,255*abs(sin(millis()/314.0)));
     textSize(50);
     text("HAND OUT OF DETECT RANGE!!!",width/2,height/2);
     tps.update();
    }
}
}