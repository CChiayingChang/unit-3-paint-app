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
int whatcolour;
int opencolour;


void setup () {
  size (1050, 750);
  opencolour=0;
  int whatcolour=red;
}

void draw () {
  //the toolbar
  fill (grey);
  noStroke ();
  rect (0, 0, 150, 1000);
  
  buttons (0, 0);
  
  //colour indicator
    fill (whatcolour);
    stroke (black);
    rect (45, 330, 60, 35);
  
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
    changing ();
  } else {
    stroke (c);
  }
}

void mouseReleased () {
  changing ();
}

void changecolour (int x, int y, int c) {
  if (mouseX>x-25 && mouseX <x+25 && mouseY>y-25 && mouseY<y+25) {
    whatcolour=c;
  }
}

void changing () {
  changecolour (42, 100, red);
  changecolour (108, 100, orange);
  changecolour (42, 160, yellow);
  changecolour (108, 160, green);
  changecolour (42, 220, blue);
  changecolour (108, 220, purple);
  changecolour (42, 280, lightgrey);
  changecolour (108, 280, black);
}

void buttons (int x, int y) {
  pushMatrix ();
    translate (x, y);
    //buttons
    button (42, 100, red);
    button (108, 100, orange);
    button (42, 160, yellow);
    button (108, 160, green);
    button (42, 220, blue);
    button (108, 220, purple);
    button (42, 280, lightgrey);
    button (108, 280, black);
  popMatrix ();
}
