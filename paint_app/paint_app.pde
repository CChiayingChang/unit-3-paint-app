color grey=#ADABAB;
color white=#FFFFFF;
color red=#E5001B;
color orange=#E88F00;
color yellow=#E5D300;
color green=#00C639;
color blue=#00C5FF;
color purple=#7E00FF;
color black=#000000;
color darkgrey=#989697;
color lightgrey=#DBDBDB;
int opencolour;


void setup () {
  size (1050, 750);
  opencolour=0;
}

void draw () {
  //the toolbar
  fill (grey);
  noStroke ();
  rect (0, 0, 150, 1000);
  button (42, 100, red);
  button (108, 100, orange);
  button (42, 160, yellow);
  button (108, 160, green);
  button (42, 220, blue);
  button (108, 220, purple);
  button (42, 280, lightgrey);
  button (108, 280, black);
  
  //colour selector button
  
  
  println (mouseX, mouseY);
}

void button (int x, int y, int c) {
  fill (c);
  strokeWeight (2);
  tactile (x, y, c);
  circle (x, y, 50);
}

void tactile (int x, int y, int c) {
  if (mouseX>x-25 && mouseX <x+25 && mouseY>y-25 && mouseY<y+25) {
    stroke (white);
  } else {
    stroke (c);
  }
}

void mouseReleased () {
  if 
}
