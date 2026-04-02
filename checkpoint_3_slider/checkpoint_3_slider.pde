float slidery;
float diameter;

void setup () {
  size (700, 700);
  slidery=350;
  diameter=75;
  fill (0);
  stroke (0);
  strokeWeight (5);
}

void draw () {
  background (225, 0, 0);
  slider (350);
}

void slider (int x) {
  line (x, 100, x, 600);
  circle (x, slidery, diameter);
}
 
 void mouseDragged () {//if you drag the mouse around it'll move
  moveslider ();
 }
 
 void mouseReleased () {
   moveslider ();
 }
 
 void moveslider () {
   if (mouseX > 325 && mouseX<375 && mouseY>100 && mouseY<600) { //circle only works if within 25 of the line (y axis)
    slidery=mouseY; //the circle will not go off the line
  }
  diameter=map (slidery, 100, 600, 5, 145);
 }
