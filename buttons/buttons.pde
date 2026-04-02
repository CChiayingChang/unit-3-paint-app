//colour pallette
color darkgreen=#008354;
color green=#00C17C;
color lightgreen=#00F099;
color black=#000505;
color lightblue=#B6EDED;

//variables
color chosencolour; 

void setup () {
  size (800, 800);
  background (lightblue);
  stroke (black);
  strokeWeight (3);
  chosencolour=darkgreen;
}

void draw () {
  
  //buttons
    tactile (175, 700, 50, lightgreen);
    fill (lightgreen);
    circle (175, 700, 100);
    
    tactile (400, 700, 50, green);
    fill (green);
    circle (400, 700, 100);
    
    tactile (625, 700, 50, darkgreen);
    fill (darkgreen);
    circle (625, 700, 100);
    
  stroke (black);
  fill (chosencolour);
  square (175, 100, 450);
  
}

void mouseReleased () {///this is an already existing function
  if (dist(175, 700, mouseX, mouseY) < 50) {
    chosencolour=lightgreen;
  }
  if (dist(400, 700, mouseX, mouseY) < 50) {
    chosencolour=green;
  }
  if (dist(625, 700, mouseX, mouseY) < 50) {
    chosencolour=darkgreen;
  }
}

void tactile (int x, int y, int r, int c) {
  if (dist(x, y, mouseX, mouseY)<r) {
    stroke (c);
  } else {
    stroke (black);
  }
}
