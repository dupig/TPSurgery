void angle_radar(float x, float y, float r, float angle,String t)
{

//angle = random(0,90);
noFill();
stroke(255,100);
strokeWeight(0.1*r);
ellipse(x,y,0.6*r,0.6*r);

stroke(255);
strokeWeight(1);
ellipse(x,y,r,r);

pushMatrix();
translate(x,y);
fill(b);
noStroke();
rectMode(CENTER);
rotate((angle/90)*PI*2);
rect(0.3*r,0,0.3*r,5);
popMatrix();
stroke(b);
strokeWeight(1);
noFill();
rect(x,y+r*0.7,r,0.25*r);
textFont(myFont);
textSize(0.15*r);
textAlign(CENTER);
text(t,x-0.2*r,y+r*0.75);
fill(255);
textSize(0.1*r);
text(angle,x+0.2*r,y+r*0.75);


}