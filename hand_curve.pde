void hand_left_icon(float x, float y, float k)
{

noFill();
strokeWeight(1);
arc(x-10*resolution*k,y-40*resolution*k,20*resolution*k,20*resolution*k,PI,2*PI);
arc(x+10*resolution*k,y-40*resolution*k,20*resolution*k,20*resolution*k,PI,2*PI);
arc(x+30*resolution*k,y-40*resolution*k,20*resolution*k,20*resolution*k,PI,2*PI);
arc(x-20*resolution*k,y+60*resolution*k,40*resolution*k,40*resolution*k,PI*0.5,PI);
arc(x+40*resolution*k,y+60*resolution*k,40*resolution*k,40*resolution*k,0,PI*0.5);
line(x+20*resolution*k,y-40*resolution*k,x+20*resolution*k,y+20*resolution*k);
line(x,y-40*resolution*k,x,y+20*resolution*k);
line(x-20*resolution*k,y+80*resolution*k,x+40*resolution*k,y+80*resolution*k);
arc(x-30*resolution*k,y-30*resolution*k,20*resolution*k,20*resolution*k,PI,2*PI);
line(x+40*k*resolution,y-40*k*resolution,x+40*k*resolution,y+20*k*resolution);
line(x-20*k*resolution,y-40*k*resolution,x-20*k*resolution,y+20*k*resolution);
line(x-40*k*resolution,y-30*k*resolution,x-40*k*resolution,y+60*k*resolution);
line(x+60*k*resolution,y+10*k*resolution,x+60*k*resolution,y+60*k*resolution);
arc(x+50*k*resolution,y+10*k*resolution,20*k*resolution,20*k*resolution,PI,2*PI);
}

void hand_right_icon(float x, float y, float k)
{

noFill();
strokeWeight(1);
arc(x-10*k*resolution,y-40*k*resolution,20*k*resolution,20*k*resolution,PI,2*PI);
arc(x+10*k*resolution,y-40*k*resolution,20*k*resolution,20*k*resolution,PI,2*PI);
arc(x+30*k*resolution,y-40*k*resolution,20*k*resolution,20*k*resolution,PI,2*PI);
arc(x-20*k*resolution,y+60*k*resolution,40*k*resolution,40*k*resolution,PI*0.5,PI);
arc(x+40*k*resolution,y+60*k*resolution,40*k*resolution,40*k*resolution,0,PI*0.5);
line(x+20*k*resolution,y-40*k*resolution,x+20*k*resolution,y+20*k*resolution);
line(x,y-40*k*resolution,x,y+20*k*resolution);
line(x-20*k*resolution,y+80*k*resolution,x+40*k*resolution,y+80*k*resolution);
arc(x+50*k*resolution,y-30*k*resolution,20*k*resolution,20*k*resolution,PI,2*PI);
line(x-20*k*resolution,y-40*k*resolution,x-20*k*resolution,y+20*k*resolution);
line(x+40*k*resolution,y-40*k*resolution,x+40*k*resolution,y+20*k*resolution);
line(x+60*k*resolution,y-30*k*resolution,x+60*k*resolution,y+60*k*resolution);
line(x-40*k*resolution,y+10*k*resolution,x-40*k*resolution,y+60*k*resolution);
arc(x-30*k*resolution,y+10*k*resolution,20*k*resolution,20*k*resolution,PI,2*PI);
}