// MAINPAGE
float x = 400;
float y = 400;
float Door1X = 400;
float Door1Y = 0;
float Door2X = 400;
float Door2Y = 800;
float Door3X = 800;
float Door3Y = 400;
float Door1bX = 400;
float Door1bY = 800;
float offset4;
int place = 0;
// GAME DOOR
int[] Game = new int[10000];
float xs = 1;
float ys = 1;
// NIGHT SKY DOOR
PImage NightSky;
int[] starsX = new int[7];
int[] starsY = new int[7];
int[] stars2X = new int[7];
int[] stars2Y = new int[7];
int[] stars3X = new int[7];
int[] stars3Y = new int[7];
float offset1;
float offset2;
float offset3;
float xaxis;
float circleX = 50;
float circleY = 50;
float circle2X = 50;
float circle2Y = 50;
//DRAWING DOOR
float circleDimensions = 20;
float bounceX = 1;
float bounceY = 1;
float bounce2X = 1;
float bounce2Y = 1;
float C1x = 400;
float C1y = 100;

void setup()
{
  size(800, 800);
  // Game Door
  for (int i=0; i < 1000; i++)
  {
    Game[i] = (int)random(800, 1600);
  }
  // Night Sky Door
  NightSky = loadImage("night sky.jpg");
  NightSky.resize(1000, 800);
  for (int i=0; i < 7; i++)
  {
    starsX[i] = (int)random(0, 800);
  }
  for (int i=0; i < 7; i++)
  {
    starsY[i] = (int)random(0, 800);
  }
  for (int i=0; i < 7; i++)
  {
    stars2X[i] = (int)random(0, 800);
  }
  for (int i=0; i < 7; i++)
  {
    stars2Y[i] = (int)random(0, 800);
  }
  for (int i=0; i < 7; i++)
  {
    stars3X[i] = (int)random(0, 800);
  }
  for (int i=0; i < 7; i++)
  {
    stars3Y[i] = (int)random(0, 800);
  }
}

void draw()
{
  if (place == 0)
  {
    Mainpage();
    star(x, y);
  }

  fill(0);
  textSize(18);
  star(x, y);

  if (place == 1)
  {
    Door1();
  }
  if (place == 2)
  {
    Door1b();
  }
  if (place == 3)
  {
    Door2();
  }
  if (place == 4)
  {
    background(255, 255, 255);
    Door3();
  }
}

void star(float x, float y)
{
  fill(#E3F572);
  stroke(#9CA562);
  strokeWeight(1);
  triangle(x-50, y, x, y-25, x, y+25);
  triangle(x+50, y, x, y-25, x, y+25);
  triangle(x, y+50, x-25, y, x+25, y);
  triangle(x, y-50, x-25, y, x+25, y);
  fill(#E3F572);
  stroke(#E3F572);
  rect(x-25, y-12, 50, 24);
  fill(random(255), random(255), random(255));
  triangle(x, y-40, x-10, y-20, x+10, y-20);
  triangle(x, y+40, x-10, y+20, x+10, y+20);
}

void Mainpage()
{
  star(x, y);
  fill(#9FFAF1);
  stroke(#9FFAF1);
  rect(0, 400-500, 800, 200);
  fill(#AEFAE2);
  stroke(#AEFAE2);
  rect(0, 400-300, 800, 200);
  fill(#B8FAD0);
  stroke(#B8FAD0);
  rect(0, 400-100, 800, 200);
  fill(#C7F5C3);
  stroke(#C7F5C3);
  rect(0, 400+100, 800, 200);
  fill(#DBF5CD);
  stroke(#DBF5CD);
  rect(0, 400+300, 800, 200);
  // DOORS
  fill(0);
  ellipse(Door1X, Door1Y, 300, 70);
  ellipse(Door2X, Door2Y, 300, 70);
  ellipse(Door3X, Door3Y, 70, 300);
  // SIGNS ON DOORS
  fill(255, 255, 255);
  textSize(10);
  text("(star will follow the mouse)", 345, 30);
  textSize(18);
  text("game", 375, 20);
  text("night sky", 360, 790);
  text("d", 780, 375);
  text("r", 780, 390);
  text("a", 780, 405);
  text("w", 780, 420);
  float DDoor1 = dist(x, y, Door1X, Door1Y);
  if (DDoor1 < 25+60)
  {
    place = 1;
  }
  float DDoor2 = dist(x, y, Door2X, Door2Y);
  if (DDoor2 < 25+60)
  {
    place = 3;
  }
  float DDoor3 = dist(x, y, Door3X, Door3Y);
  if (DDoor3 < 25+60)
  {
    place = 4;
  }
  offset4 = random(0, 3);
  fill(#919341);
  text("STAR", 190+offset4, 100);
  fill(50);
  offset4 = random(0, 3);
  text("Welcome to the          doors!", 50, 100);
  text("The three doors each lead", 50, 150);
  text("to a different place, and", 50, 170);
  text("the star is controlled using", 50, 190);
  text("the arrow keys", 50, 210);
  star(x, y);
}

void Door1()
{
  frameRate(60);
  background(255, 255, 255);
  fill(0);
  star(mouseX, mouseY);

  for (int i=0; i < 1000; i++)
  {
    fill(0);
    ellipse(50*i, Game[i], 20, 20);
    Game[i] = Game[i] - 5;

    if (Game[i] < 0)
    {
      Game[i] = 800;
    }
    float D = dist(50*i, Game[i], mouseX, mouseY);
    if (D<20+25)
    {
      Door1b();
    }
  }
}

void Door1b()
{
  place = 2;
  background(255, 0, 0);
  backArrow();
  fill(255, 255, 255);
  textSize(80);
  text("GAME OVER", 150, 400);
}

void backArrow()
{
  float backArrow = dist(circle2X, circle2Y, mouseX, mouseY);
  fill(0);
  stroke(0);
  ellipse(circle2X, circle2Y, 50, 50);
  stroke(255, 255, 255);
  strokeWeight(5);
  line(35, 50, 68, 50);
  line(35, 50, 50, 35);
  line(35, 50, 50, 65);
  if (backArrow<25 && mousePressed)
  {
    place = 0;
    x=400;
    y=400;
  }
}

void Door2()
{
  image(NightSky, 0, 0);
  offset1 = random(0, 10);
  offset2 = random(0, 5);
  offset3 = random(0, 2);
  for (int i=0; i < 7; i++)
  {
    stars(starsX[i], starsY[i]);
    starsX[i] = starsX[i] - 6;
    starsY[i] = starsY[i] + 4;
    if (starsX[i]< 0)
    {
      starsX[i] = 800;
    }
    if (starsY[i] > 800)
    {
      starsY[i] = 0;
    }
  }
  for (int i=0; i < 7; i++)
  {
    layer2Stars(stars2X[i], stars2Y[i]);
    stars2X[i] = stars2X[i] - 3;
    stars2Y[i] = stars2Y[i] + 2;
    if (stars2X[i]< 0)
    {
      stars2X[i] = 800;
    }
    if (stars2Y[i] > 800)
    {
      stars2Y[i] = 0;
    }
  }
  for (int i=0; i < 7; i++)
  {
    layer3Stars(stars3X[i], stars3Y[i]);
    stars3X[i] = stars3X[i] - 2;
    stars3Y[i] = stars3Y[i] + 1;
    if (stars3X[i]< 0)
    {
      stars3X[i] = 800;
    }
    if (stars3Y[i] > 800)
    {
      stars3Y[i] = 0;
    }
  }
  backArrow();
}

void stars(int x, int y)
{
  fill(249, 250, 58);
  stroke(249, 250, 58);
  ellipse(x, y+offset1, 15, 15);
}

void layer2Stars(int x, int y)
{
  fill(211, 211, 70);
  stroke(211, 211, 70);
  ellipse(x, y+offset2, 15, 15);
}

void layer3Stars(int x, int y)
{
  fill(#C0C171);
  stroke(#C0C171);
  ellipse(x, y+offset3, 15, 15);
}

void Door3()
{
  background(255, 255, 255);
  backArrow();
  star(x-650, y);
  spawnCircles();
}

void spawnCircles()
{
  float D = dist(mouseX, mouseY, circleX, circleY);
  float D2 = dist(mouseX, mouseY, C1x, C1y);
  ellipse(circleX, circleY, 50, 50);
  circleX = circleX + 6 * bounceX;
  circleY = circleY + 4 * bounceY;
  if (D<25)
  {
    background(random(255), random(255), random(255));
  }
  if (circleX>775)
  {
    bounceX = -1;
  }
  if (circleX<25)
  {
    bounceX = 1;
  }
  if (circleY<25)
  {
    bounceY = 1;
  }
  if (circleY>775)
  {
    bounceY = -1;
  }
  fill(255,0,0);
  stroke(255,0,0);
  ellipse(C1x, C1y, 50, 50);
  C1x=C1x+2*bounce2X;
  C1y=C1y+5*bounce2Y;
  if (C1x>775)
  {
    bounce2X = -1;
  }
  if (C1x<25)
  {
    bounce2X = 1;
  }
  if (C1y>775)
  {
    bounce2Y = -1;
  }
  if (C1y<25)
  {
    bounce2Y = 1;
  }
  if (D2<25)
  {
    if (mousePressed)
    {
      C1x=mouseX;
      C1y=mouseY;
    }
  }
}

/*
  //fill(random(255), random(255), random(255));
 //ellipse(mouseX, mouseY, circleDimensions, circleDimensions);
 if (key == 'n' | key == 'N')
 {
 circleDimensions = circleDimensions - 5;
 }
 if (key == 'm' | key == 'M')
 {
 circleDimensions = circleDimensions + 5;
 }
 if (keyCode == TAB)
 {
 background(255, 255, 255);
 }
 */


void keyPressed()
{
  if (keyCode == RIGHT)
  {
    x = x+15;
  }
  if (keyCode == LEFT)
  {
    x = x-15;
  }
  if (keyCode == UP)
  {
    y = y-15;
  }
  if (keyCode == DOWN)
  {
    y = y+15;
  }
}
