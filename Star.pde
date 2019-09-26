PImage backgroundGravel;
PImage starCharacter;
float x = 500;
float y = 400;
float Door1X = 400;
float Door1Y = -910;
float Door2X = 400;
float Door2Y = 1710;

void setup()
{
  size(800, 800);
  backgroundGravel = loadImage("gravel.jpg");
  starCharacter = loadImage("star.jpg");
}
void draw()
{
  //image(backgroundGravel, 0, 0);
  //image(starCharacter, x, y);
  mainPage();
  star();
}

void mainPage()
{
  // BACKGROUND
  fill(#393DF5);
  stroke(#393DF5);
  rect(0, y-600, 800, 200);
  fill(129, 132, 255);
  stroke(129, 132, 255);
  rect(0, y-500, 800, 200);
  fill(162, 163, 250);
  stroke(162, 163, 250);
  rect(0, y-300, 800, 200);
  fill(198, 199, 245);
  stroke(198, 199, 245);
  rect(0, y-100, 800, 200);
  fill(#D0D0F5);
  stroke(#D0D0F5);
  rect(0, y+100, 800, 200);
  fill(#DCDCE5);
  stroke(#DCDCE5);
  rect(0, y+300, 800, 200);
  fill(#CACACE);
  stroke(#CACACE);
  rect(0, y+500, 800, 200);
  fill(0);
  
  //DOORS
  ellipse(Door1X, Door1Y, 2000, 2000);
  ellipse(Door2X, Door2Y, 2000, 2000);
  float DDoor1 = dist(x,y,Door1X,Door1Y);
  float DDoor2 = dist(x,y,Door2X,Door2Y);
  
  if (DDoor1 < 1000+50)
  {
    Door1();
  }
}

void star()
{
  fill(238, 250, 111);
  stroke(238, 250, 111);
  triangle(x-50, y, x, y-25, x, y+25);
  triangle(x, y+50, x-25, y, x+25, y);
  triangle(x+50, y, x, y-25, x, y+25);
  triangle(x, y-50, x-25, y, x+25, y);
  fill(random(255), random(255), random(255));
  triangle(x, y-40, x-10, y-20, x+10, y-20);
  triangle(x, y+40, x-10, y+20, x+10, y+20);
}

void Door1()
{
background(255, 0, 0);
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    x = x+10;
  }
  if (keyCode == LEFT)
  {
    x = x-10;
  }
  if (keyCode == UP)
  {
    y = y-10;
  }
  if (keyCode == DOWN)
  {
    y = y+10;
  }
}
