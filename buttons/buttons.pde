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
    fill (lightgreen);
    circle (175, 700, 100);
    
    fill (green);
    circle (400, 700, 100);
    
    fill (darkgreen);
    circle (625, 700, 100);
    
  fill (chosencolour);
  square (175, 100, 450);
  
}

void mouseReleased () {///this is an already existing function
  if (dist(175, 700, mouseX, mouseY) < 50) {
    
  }
}
