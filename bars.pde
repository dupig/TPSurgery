void bars(float x, float y, color c)
{

float t = millis()%2000;
noStroke();
fill(255,30);
rectMode(CENTER);
rect(x,y,10*resolution,300*resolution);
rect(x-12*resolution,y,10*resolution,300*resolution);
rect(x+12*resolution,y,10*resolution,300*resolution);
fill(c);
rectMode(CENTER);
rect(x,y+75*resolution-50*resolution*sin(t/2000.0*2*PI),10*resolution,150*resolution+100*resolution*sin(t/2000.0*2*PI));
fill(255);
rect(x-12*resolution,y+100*resolution-50*resolution*cos(t/2000.0*2*PI),10*resolution,100*resolution+100*resolution*cos(t/2000.0*2*PI));
rect(x+12*resolution,y+100*resolution-50*resolution*cos(t/2000.0*2*PI+0.25*PI),10*resolution,100*resolution+100*resolution*cos(t/2000.0*2*PI+0.25*PI));
fill(255);
textMode(CENTER);
textSize(10);
text("HGB",x,y+175*resolution);
stroke(c);
strokeWeight(3);
line(x+20*resolution,y-160*resolution,x+20*resolution,y-155*resolution);
line(x+15*resolution,y-160*resolution,x+20*resolution,y-160*resolution);
line(x-20*resolution,y-160*resolution,x-20*resolution,y-155*resolution);
line(x-15*resolution,y-160*resolution,x-20*resolution,y-160*resolution);
line(x+20*resolution,y+190*resolution,x+20*resolution,y+185*resolution);
line(x+15*resolution,y+190*resolution,x+20*resolution,y+190*resolution);
line(x-20*resolution,y+190*resolution,x-20*resolution,y+185*resolution);
line(x-15*resolution,y+190*resolution,x-20*resolution,y+190*resolution);
}

void bars_2(float x, float y, color c)
{

float t = millis()%2000;
noStroke();
fill(255,30);
rectMode(CENTER);
rect(x,y,10*resolution,300*resolution);
rect(x-12*resolution,y,10*resolution,300*resolution);
rect(x+12*resolution,y,10*resolution,300*resolution);
fill(c);
rectMode(CENTER);
rect(x,y+75*resolution-50*resolution*cos(t/2000.0*2*PI),10*resolution,150*resolution+100*resolution*cos(t/2000.0*2*PI));
fill(255);
rect(x-12*resolution,y+100*resolution-50*resolution*sin(t/2000.0*2*PI),10*resolution,100*resolution+100*resolution*sin(t/2000.0*2*PI));
rect(x+12*resolution,y+100*resolution-50*resolution*sin(t/2000.0*2*PI+0.25*PI),10*resolution,100*resolution+100*resolution*sin(t/2000.0*2*PI+0.25*PI));
fill(255);
textMode(CENTER);
textSize(10);
text("HGB",x,y+175*resolution);
stroke(c);
strokeWeight(3);
line(x+20*resolution,y-160*resolution,x+20*resolution,y-155*resolution);
line(x+15*resolution,y-160*resolution,x+20*resolution,y-160*resolution);
line(x-20*resolution,y-160*resolution,x-20*resolution,y-155*resolution);
line(x-15*resolution,y-160*resolution,x-20*resolution,y-160*resolution);
line(x+20*resolution,y+190*resolution,x+20*resolution,y+185*resolution);
line(x+15*resolution,y+190*resolution,x+20*resolution,y+190*resolution);
line(x-20*resolution,y+190*resolution,x-20*resolution,y+185*resolution);
line(x-15*resolution,y+190*resolution,x-20*resolution,y+190*resolution);
}