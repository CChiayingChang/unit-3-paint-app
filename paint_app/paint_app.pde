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
boolean Stamp; //true or false
PImage eraser;
//int drawcolour;
int ERASER;
PGraphics drawlayer;


void setup () {
  size (1050, 750);
  background (white);
 // drawcolour=whatcolour;
  whatcolour=red;
  toggle = -1;
  diameter=50;
  sliderY=140;
  stamp = loadImage ("stamp.PNG");
  Stamp=false;
  eraser=loadImage ("eraser.png");
  ERASER=1;
  drawlayer= createGraphics (1050, 750); //w, h
}

void draw () {
  background (255);
  
  //the drawing screen
  image (drawlayer, 0, 0);
  
  //the toolbar
  fill (lightgrey);
  noStroke ();
  rect (0, 0, 150, 750);
  
  //stamp button
  if (Stamp==false) {
    fill (white);
  } else {
    fill (darkgrey);
  }
  strokeWeight (2);
  tactilerectangle (30, 120, 530, 608);
  rect (30, 530, 90, 78);
  image (stamp, 48, 535, 55, 70); //image, x, y, w, h
  
  slider (75); //the slider for thickness
  
  //colour indicator
    fill (whatcolour);
    strokeWeight (2);
    tactilerectangle (45, 105, 330, 365);
    rect (45, 330, 60, 35);
    
   //for the colour palette
  if (toggle >0) {
    colourwindow (130, 345);
  }
  
  //eraser tool
  tactilerectangle (45, 105, 380, 405);
  strokeWeight (2);
  if (ERASER<1) {
    fill (white);
  } else {
    fill (#F59797);
  }
  rect (45, 380, 60, 35);
  image (eraser, 55, 380, 40, 35);
  
  println (mouseX, mouseY);
}



//things to do: make stamp stamp in middle of image
//eraser tool
//figure out colour palette

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

void tactilerectangle (int xr, int xl, int yt , int yb) {
  if (mouseX>xr && mouseX < xl && mouseY>yt && mouseY<yb) {
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
  STAMP ();
  if (mouseX>30 && mouseX < 120 && mouseY>530 && mouseY<608) {//for turning the stamp off and on
    Stamp=!Stamp; ///if its false, becomes true, if its true, becomes false
  }
  
  if (mouseX>45 && mouseX<105 && mouseY>380 && mouseY<415) {//for turning the eraser off and on
    ERASER=ERASER*-1;
  }
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
    //if (toggle>0) {
      fill (darkgrey);
    //} else {
      //noFill ();
    //}
    noStroke ();
    triangle (0, 0, 50, -50, 50, 50);
    rect (50, -140, 150, 270);
    buttons (92, -95);
  popMatrix ();
}

void mouseDragged () { 
  STAMP ();
  moveslider ();
  Eraser ();
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

void STAMP () {
  drawlayer.beginDraw ();
  
    if (mouseX>150) {
      if (Stamp==false) {//for single= its equa to that value, ==you're ocmparing them
        //drawing the squiggly line
       // stroke (drawcolour);
       drawlayer.stroke (whatcolour);
        if (mouseX>150) {//prevents seeing flashes of colour from drawing on toolbar
          drawlayer.strokeWeight (diameter);
          drawlayer.line (pmouseX, pmouseY, mouseX, mouseY); //pmouseX and pmouseY are the mouse's previous coordinates
        } 
      } else {
          drawlayer.image (stamp, mouseX, mouseY, diameter, diameter*1.27);
      }
    }
    
  drawlayer.endDraw ();
}

void Eraser () {
  if (ERASER<1) {
    whatcolour=white;
  }
}
