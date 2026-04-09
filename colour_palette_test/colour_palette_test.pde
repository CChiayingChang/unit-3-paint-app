PGraphics colourpalette;
PGraphics screen;
int toggle;
int colour;
color purple =#9A00D8;
color yellow=#EDE602;

void setup () {
  size ( 800, 800);
  screen=createGraphics (width, height);
  toggle=1;
  colour=yellow;
}

void draw () {
  background (255);
  
  //button
  if (toggle>0) {
    fill (yellow);
  } else {
    fill (purple);
  }
  
  rect (100, 100, 100, 100);
  
  image (screen, 0, 0);
  
  if (toggle<0) {
    fill (225, 0, 0);
    circle (400, 400, 200);
  } 
  
  
  println (mouseX, mouseY);
}

void mouseReleased () {
  if (mouseX > 100 && mouseX < 200 && mouseY>100 && mouseY<200) {
    toggle = toggle*-1;
  }
}

void mouseDragged () {
  screen.beginDraw ();
    screen.line (pmouseX, pmouseY, mouseX, mouseY);
  screen.endDraw ();
}
