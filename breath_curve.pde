float breathing_curve[] = new float[51];
float breathing_curve_2[] = new float[51];
void breath_curve(float x, float y, color c)
{
  if(millis()%500<20)
  { breathing_curve[50] = random(-40,40);
    for(int j = 0; j <50; j++)   breathing_curve[j] = breathing_curve[j+1];
  }
  noStroke();
  fill(255,10);
  rectMode(CENTER);
  rect(x,y,500*resolution,100*resolution);
  noFill();
  stroke(255,30);
  strokeWeight(1);
  for(int i  = 0; i< 5; i ++)
  {
  line(x-250*resolution+i*100*resolution,y-50*resolution,x-250*resolution+i*100*resolution,y+50*resolution);
  line(x-250*resolution,y-50*resolution+i*25*resolution,x+250*resolution,y-50*resolution+i*25*resolution);
  }
  line(x+250*resolution,y-50*resolution,x+250*resolution,y+50*resolution);
  stroke(255,200);
  strokeWeight(3);
  line(x-250*resolution,y-50*resolution,x-250*resolution,y+50*resolution);
  line(x-250*resolution,y,x+250*resolution,y);
  stroke(c);
  strokeWeight(1);
  for(int k = 0; k < 49; k ++)   
  {line(x-250*resolution + 10*resolution*k,y + breathing_curve[k]*resolution,x-250*resolution + 10*k*resolution+10*resolution ,y + breathing_curve[k+1]*resolution);}
  noStroke();
  fill(255);
  textMode(CENTER);
  textSize(10*resolution);
  for(int i = 0;i<6;i++)  text(i,x-250*resolution+100*i*resolution,y+60*resolution);
  for(int i = 0;i<5;i++)  text(10*i+10,x-270*resolution,y+50*resolution-25*i*resolution);
  textSize(15*resolution);
  text("oxygen saturation", x - 190*resolution, y - 70*resolution);
}

void breath_curve_2(float x, float y, color c)
{
  if(millis()%500<20)
  { breathing_curve_2[50] = random(-30,30);
    for(int j = 0; j <50; j++)   breathing_curve_2[j] = breathing_curve_2[j+1];
  }
  noStroke();
  fill(255,10);
  rectMode(CENTER);
  rect(x,y,500*resolution,100*resolution);
  noFill();
  stroke(255,30);
  strokeWeight(1);
  for(int i  = 0; i< 5; i ++)
  {
  line(x-250*resolution+i*100*resolution,y-50*resolution,x-250*resolution+i*100*resolution,y+50*resolution);
  line(x-250*resolution,y-50*resolution+i*25*resolution,x+250*resolution,y-50*resolution+i*25*resolution);
  }
  line(x+250*resolution,y-50*resolution,x+250*resolution,y+50*resolution);
  stroke(255,200);
  strokeWeight(3);
  line(x-250*resolution,y-50*resolution,x-250*resolution,y+50*resolution);
  line(x-250*resolution,y,x+250*resolution,y);
  stroke(c);
  strokeWeight(1);
  for(int k = 0; k < 49; k ++)   
  {line(x-250*resolution + 10*k*resolution,y + breathing_curve_2[k]*resolution,x-250*resolution + 10*k*resolution+10*resolution ,y + breathing_curve_2[k+1]*resolution);}
  noStroke();
  fill(255);
  textMode(CENTER);
  textSize(10*resolution);
  for(int i = 0;i<6;i++)  text(i,x-250*resolution+100*i*resolution,y+60*resolution);
  for(int i = 0;i<5;i++)  text(20*i+5,x-270*resolution,y+50*resolution-25*i*resolution);
  textSize(15*resolution);
  text("carbon dioxide", x - 195*resolution, y - 70*resolution);
}