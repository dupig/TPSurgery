void light_round_bg(float x,float y,float r)
{
float para = 20;
noFill();
stroke(255);
strokeWeight(2);
ellipse(x,y,r*1.6*resolution,r*1.6*resolution);
strokeWeight(1);
ellipse(x,y,r*1.6*resolution-10*resolution,r*1.6*resolution-10*resolution);
strokeWeight(3);
ellipse(x,y,1.9*r*resolution,1.9*r*resolution);
ellipse(x,y,2*r*resolution,2*r*resolution);
for(int i = 0;i<64;i++) 
{
stroke(255);
strokeWeight(1);
line(x+(0.85*r+para)*sin(i*PI/32)*resolution,y+(0.85*r+para)*cos(i*PI/32)*resolution,x+(0.85*r-para)*sin(i*PI/32)*resolution,y+(0.85*r-para)*cos(i*PI/32)*resolution);
noStroke();
fill(b);
ellipse(x+(0.85*r+para+5)*sin(i*PI/32-PI/180)*resolution,y+(0.85*r+para+5)*cos(i*PI/32-PI/180)*resolution,2*resolution,2*resolution);
ellipse(x+(0.85*r+para+5)*sin(i*PI/32+PI/180)*resolution,y+(0.85*r+para+5)*cos(i*PI/32+PI/180)*resolution,2*resolution,2*resolution);
}
stroke(255);
line(x-0.8*r*resolution,y,x-0.1*r*resolution,y);
line(x+0.8*r*resolution,y,x+0.1*r*resolution,y);
line(x,y-0.8*r*resolution,x,y-0.1*r*resolution);
line(x,y+0.8*r*resolution,x,y+0.1*r*resolution);
noFill();
stroke(b);
ellipse(x,y,0.15*r*resolution,0.15*r*resolution);
pushMatrix();
translate(x,y);

for(int i = 0;i<40;i++) 
{
noFill();
stroke(b);
strokeWeight(1);
rectMode(CENTER);
rotate(PI/20);
rect(0,0.75*r*resolution,25*resolution,5*resolution);
}

popMatrix();
}