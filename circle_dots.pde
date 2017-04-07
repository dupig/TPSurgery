float circle_dots_para[] = new float[15];

void circle_dots(float x, float y, int r, float k)
{

fill(255);
noStroke();

for(int i = 0;i<15;i++)
{ if( millis()%200<=20) circle_dots_para[i] = random(0,1);
{if(circle_dots_para[i] >k) 
ellipse(x+r*sin(i*2*PI/15),y+r*cos(i*2*PI/15),2,2);}
}
}