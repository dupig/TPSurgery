float menuX = 300*resolution;
float menuY = 850*resolution;
float menuA = 500*resolution;
float menuB = 300*resolution;
long switch_time = 0;

boolean switch_available = true;
boolean switch_triggered = false;


void menu()
  { 
    
    float pinch = 0;
    float handX = 0;
    float handY = 0; 

    noStroke();
    if(switch_available) fill(255,25+20*cos(cameraAngle));
    else fill(155);
    rectMode(CENTER);
    rect(menuX,menuY,menuA-20,menuB-20);
    strokeWeight(3);
    stroke(b);
    line(menuX-menuA/2,menuY-menuB/2,menuX-menuA/2+5*resolution,menuY-menuB/2);
    line(menuX-menuA/2,menuY-menuB/2,menuX-menuA/2,menuY-menuB/2+5*resolution);
    line(menuX+menuA/2,menuY-menuB/2,menuX+menuA/2-5*resolution,menuY-menuB/2);
    line(menuX+menuA/2,menuY-menuB/2,menuX+menuA/2,menuY-menuB/2+5*resolution);
    line(menuX-menuA/2,menuY+menuB/2,menuX-menuA/2+5*resolution,menuY+menuB/2);
    line(menuX-menuA/2,menuY+menuB/2,menuX-menuA/2,menuY+menuB/2-5*resolution);
    line(menuX+menuA/2,menuY+menuB/2,menuX+menuA/2-5*resolution,menuY+menuB/2);
    line(menuX+menuA/2,menuY+menuB/2,menuX+menuA/2,menuY+menuB/2-5*resolution);
    if(switch_available) fill(b);
    else fill(155);
    textSize(25*resolution);
    textAlign(CENTER);
    text("HOLD HERE TO SWITCH",menuX,menuY+50*resolution);
    tps.update();  
    for (Hand handIn : leap.getHands ()) 
    {
      hand = handIn;
      handX = map(hand.getRawPosition().x,threshold_x_min, threshold_x_max, 0, width);
      handY = map(hand.getRawPosition().z,threshold_z_min, threshold_z_max, 0, height);
      pinch = hand.getPinchStrength();
    }
    //if(millis()-switch_time>3000 && !switch_triggered){ switch_available = true;}
    if(millis()-switch_time>3000 && !(handX>=menuX-menuA/2-20&&handX<=menuX+menuA/2+20&&handY>=menuY-menuB/2-20&&handY<=menuY+menuB/2+20&&pinch<0.8) )  
    {switch_available = true;

     }
    else
    {
        duration_Hand = 0;
    }
    default_hand_hold();
    
    

    //map(location.x,threshold_x_min, threshold_x_max, 0, width), map(location.z,threshold_z_min, threshold_z_max, 0, height)
    if(handX>=menuX-menuA/2&&handX<=menuX+menuA/2&&handY>=menuY-menuB/2&&handY<=menuY+menuB/2&&pinch<0.8)
      { 
        //switch_triggered = true;
        if(switch_available){
        switch_time = millis();
        noStroke();
        fill(b);
        rect(menuX,menuY,menuA-20*resolution,menuB-20*resolution);
        fill(255,155);
        rect(menuX,menuY+menuB/2-10*resolution-(menuB-20)*(duration_Hand/TimeTrigger_2*1.0)/2*resolution,menuA-20*resolution,(menuB-20)*(duration_Hand/TimeTrigger_2*1.0)*resolution);
        fill(10);
        textSize(25);
        textAlign(CENTER);
        text("SWITCHING",menuX,menuY);
        tps.menu.set(b);
        tps.update();
        if(default_hand_hold)
        {switch_available = false;
        if(state==2) 
        {state = 1;
         duration_Hand = 0;}
        else if(state==1) 
        {state = 2;    
        duration_Hand = 0;}
      }
      }
      }
    else 
    { 
      //switch_triggered = false;
     if(state == 0) tps.menu.set(color(0));
     if(state == 1) tps.menu.set(color(155));
     if(state == 2) tps.menu.set(color(155,0,50));
    stroke(255);
    if(defaultHand) hand_right_icon(menuX-5*resolution,menuY-50*resolution,0.6);
    else hand_left_icon(menuX-5*resolution,menuY-50*resolution,0.6);
     }

    }