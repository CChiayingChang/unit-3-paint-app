//colour pallette
color grey=#909090;
color red=#DE0000;
color black=#000000;
color white=#FFFFFF;
color chosencolour;

void setup () {
  size (600, 600);
  strokeWeight (5);
  background (grey);
  chosencolour=black;
}

void draw () {
  button (425, 94, white);
  
  button (425, 263, red);
  
  button (425, 432, black);
  
  fill (chosencolour);
  rect (93, 94, 250, 413);
}

void button (int x, int y, int c) {
  fill (c);
  rect (x, y, 125, 75);
}

void tactile (int x, int y, int c) {

}

void mouseReleased () {
  if (mouseX>425 && mouseX<550 && mouseY>94 && mouseY<169) {
     chosencolour=white;
  }
  if (mouseX>425 && mouseX<550 && mouseY>263 && mouseY<338) {
     chosencolour=red;
  }
  if (mouseX>425 && mouseX<550 && mouseY>432 && mouseY<507) {
     chosencolour=black;
  }
}
