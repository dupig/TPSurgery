boolean flag_startHand = false;
boolean flag_moveHand = false;
float dist_Hand = 0.0;
long time_startHand = 0;
int duration_Hand = 0;


final float TimeTrigger_2 = 2000;



void default_hand_hold()
 {
    
  int hands = 0;
  
  for (Hand handIn : leap.getHands ()) {
    hand = handIn;
    if(hand.getRawPosition().z>threshold_z_min&&hand.getRawPosition().z<threshold_z_max&&hand.getRawPosition().x>threshold_x_min&&hand.getRawPosition().x<threshold_x_max&&hand.getRawPosition().y>threshold_y_min&&hand.getRawPosition().y<threshold_y_max){
    if(defaultFlag && defaultHand==false)
    {
    if(hand.isLeft())hands++;
    }
    else if(defaultFlag && defaultHand)
    {
    if(hand.isRight())hands++;
    }
  }
  
  if ( hands > 0) {
    PVector translation = hand.getPosition();
    long time_currentFrame = millis();
    
    if ( flag_startHand ) {
      translation.sub( startHand.getPosition() );
      dist_Hand = translation.mag();
    }
    else dist_Hand = 2 * dist_threshold;
    
    if ( dist_Hand > dist_threshold || switch_triggered ) {
      flag_startHand = true;
      flag_moveHand = true;
      startHand = hand;
      time_startHand = millis();
      duration_Hand = 0;
    }
    else duration_Hand = int(time_currentFrame - time_startHand);

    
    if( duration_Hand > TimeTrigger_2) default_hand_hold = true;
    else if( duration_Hand < TimeTrigger_2) default_hand_hold = false;
  }
  
  if( hands == 0 ){
    flag_moveHand = false;
  }
   
   
 }
 }