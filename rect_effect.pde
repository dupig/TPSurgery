  int aaa[] = new int[10];
void rect_effect(float x, float y, String t, color c,float d,int k, int i)
{
  textMode(CENTER);
  if(millis()%1000<20) aaa[i] = int(random(40*d,50*d)+k);
  stroke(c);
  strokeWeight(3);
  line(x-50*resolution,y-30*resolution,x-50*resolution,y-25*resolution);
  line(x-50*resolution,y-30*resolution,x-45*resolution,y-30*resolution);
  noStroke();
  fill(255,30);
  rectMode(CENTER);
  rect(x,y,100*resolution,60*resolution);
  fill(255,50);
  rect(x+100*resolution,y,100*resolution,60*resolution);
  textFont(myFont);
  textMode(LEFT);
  textSize(15*resolution);
  fill(255);
  text(t,x+90*resolution,y+20*resolution);
  textSize(30*resolution);
  fill(c);
  text(aaa[i],x-20*resolution,y+18*resolution);

}