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
int toggle;


void setup () {
  size (1050, 750);
  whatcolour=red;
  toggle = 1;
}

void draw () {
  background (white);
  
  //the toolbar
  fill (lightgrey);
  noStroke ();
  rect (0, 0, 150, 1000);
  
  //buttons (0, 0);
  
  //colour indicator
    fill (whatcolour);
    stroke (black);
    rect (45, 330, 60, 35);
    
  if (toggle >0) {
    colourwindow (130, 345);
  }
  
  println (mouseX, mouseY);
}

void button (int x, int y, int c) {
  fill (c);
  strokeWeight (2);
  tactile (x, y, c);
  circle (x, y, 50);
}

void tactile (int x, int y, int c) {
  if (mouseX>x+197 && mouseX <x+247 && mouseY>y+225 && mouseY<y+275) {//the numbers are the coordinates of colourwindow + coordinates of buttons inside colourwindow +- 25 (radius)
    stroke (white);
    ///changing ();
  } else {
    stroke (c);
  }
}

void mouseReleased () {
  if (mouseX>45 && mouseX<105 && mouseY> 330 && mouseY<365) {
    toggle = toggle * -1;
  }
  changing ();
}

void changecolour (int x, int y, int c) {
  if (mouseX>x-25 && mouseX <x+25 && mouseY>y-25 && mouseY<y+25 && toggle>0) {
    whatcolour=c;
  }
}

void changing () {
  changecolour (222, 250, red);
  changecolour (288, 250, orange);
  changecolour (222, 310, yellow);
  changecolour (288, 310, green);
  changecolour (222, 370, blue);
  changecolour (288, 370, purple);
  changecolour (222, 430, lightgrey);
  changecolour (288, 430, black);
}

void buttons (int x, int y) {
  pushMatrix ();
    translate (x, y);
    //buttons
    button (0, 0, red);
    button (66, 0, orange);
    button (0, 60, yellow);
    button (66, 60, green);
    button (0, 120, blue);
    button (66, 120, purple);
    button (0, 180, lightgrey);
    button (66, 180, black);
  popMatrix ();
}

void colourwindow (int x, int y) {
  pushMatrix ();
    translate (x, y);
    fill (darkgrey);
    stroke (darkgrey);
    triangle (0, 0, 50, -50, 50, 50);
    rect (50, -140, 150, 270);
    buttons (92, -95);
  popMatrix ();
}
