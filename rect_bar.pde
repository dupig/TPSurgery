void rect_bar(float x,float y,float l,int num, String t)
{
  

for(int i = 0;i<10;i++) small_l_bar(x+120*i*l*resolution,y,l*resolution,255);
for(int j = 0;j<num;j++) small_l_bar(x+120*j*l*resolution,y,l*resolution,b);
if(millis()%2000<1000)
{small_l_bar(x+120*(num)*l*resolution,y,l*resolution,b);}
textFont(myFont);
textSize(20*resolution);
textAlign(CENTER);
fill(255);
text(t,x - 80*resolution,y +5*resolution);


}

void small_l_bar (float x, float y, float l,color c)
{
fill(c);
noStroke();
rectMode(CENTER);
rect(x,y,100*l,15*l);
rect(x+35*l,y-10*l,30*l,10*l);



}