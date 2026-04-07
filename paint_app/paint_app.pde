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
float sliderY;
float diameter;
float strokesize;
PImage stamp; //loads image


void setup () {
  size (1050, 750);
  background (white);
  whatcolour=red;
  toggle = -1;
  diameter=50;
  sliderY=140;
  //stamp = loadImage (".jpg");
}

void draw () {
  ///image (cat, 100, 100, 100, 100); //image, x, y, w, h
  //the toolbar
  fill (lightgrey);
  noStroke ();
  rect (0, 0, 150, 1000);
  
  slider (75); //the slider for thickness
  
  //colour indicator
    fill (whatcolour);
    strokeWeight (2);
    tactilerectangle (45, 105, 330, 365);
    rect (45, 330, 60, 35);
    
  if (toggle >0) {
    colourwindow (130, 345);
  }
  
  println (mouseX, mouseY);
}

void button (int x, int y, int c) {
  fill (c);
  strokeWeight (2);
  tactilecolours (x, y, c);
  circle (x, y, 50);
}

void tactilecolours (int x, int y, int c) {
  if (mouseX>x+197 && mouseX <x+247 && mouseY>y+225 && mouseY<y+275) {//the numbers are the coordinates of colourwindow + coordinates of buttons inside colourwindow +- 25 (radius)
    stroke (white);
  } else {
    stroke (c);
  }
}

void tactilerectangle (int xr, int xb, int yt , int yb) {
  if (mouseX>xr && mouseX < xb && mouseY>yt && mouseY<yb) {
    stroke (white);
  } else {
    stroke (black);
  }
}

void mouseReleased () {
  if (mouseX>45 && mouseX<105 && mouseY> 330 && mouseY<365) {
    toggle = toggle * -1; //for the colour palette popup window
  }
  changing ();
  moveslider ();
}

void changecolour (int x, int y, int c) {//if the mouse is over the coordinates, it will change the colours
  if (mouseX>x-25 && mouseX <x+25 && mouseY>y-25 && mouseY<y+25 && toggle>0) {
    whatcolour=c;
  }
}

void changing () {//this will change the colours
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

void colourwindow (int x, int y) {//this is the window thawt pops up with the colour palette
  pushMatrix ();
    translate (x, y);
    fill (darkgrey);
    noStroke ();
    triangle (0, 0, 50, -50, 50, 50);
    rect (50, -140, 150, 270);
    buttons (92, -95);
  popMatrix ();
}

void mouseDragged () { 
  //drawing the squiggly line
  stroke (whatcolour);
  if (mouseX>150) {//prevents seeing flashes of colour from drawing on toolbar
    strokeWeight (diameter);
    line (pmouseX, pmouseY, mouseX, mouseY); //pmouseX and pmouseY are the mouse's previous coordinates
  }
  moveslider ();
}

void slider (int x) {
  strokeWeight (5);
  stroke (black);
  line (x, 30, x, 250);
  fill (whatcolour);
  strokeWeight (2);
  circle (x, sliderY, diameter);
}

void moveslider () {
  if (mouseX>50 && mouseX<100 && mouseY>30 && mouseY<250) {
    sliderY=mouseY;
  }
  diameter=map(sliderY, 30, 250, 1, 100);//changing sliderY, converting from range of sliderY (30, 250) to thickness range (5, 100)
}

void newbutton () {

}
