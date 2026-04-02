float sliderym; //int can't store decimals, so we use float
float slideryt;
float slideryb;
color purple=#7402C6;
float r;
float g;
float b;

void setup () {
  size (700, 700);
  strokeWeight (5);
  fill (purple);
  stroke (purple);
  sliderym=350;
  slideryt=350;
  slideryb=350;
  r=0;
  g=0;
  b=0;
}

void draw () {
  background (r, g, b);
   r=map(slideryt, 100, 600, 0, 225); //(variable you're mapping from, then 2 numbers for the range of the variable, then the next 2 for range of what you want to convert it to
   g=map(sliderym, 100, 600, 0, 225);
   b=map(slideryb, 100, 600, 0, 225);
  
  slider (175, slideryt);
  
  slider (350, sliderym);
  
  slider (525, slideryb);
}

void slider (int x, float slider) {
  line (x, 100, x, 600);
  circle (x, slider, 50);
}

void mouseDragged () {//if you drag the mouse around it'll move
  slideryt (150, 200);
  sliderym (325, 375);
  slideryb (500, 550);
}

 void slideryt (int xt, int xb) {
    if (mouseX > xt && mouseX<xb && mouseY>100 && mouseY<600) { //circle only works if within 25 of the line (y axis)
    slideryt=mouseY; //the circle will not go off the line
  }
 }
 
 void sliderym (int xt, int xb) {
    if (mouseX > xt && mouseX<xb && mouseY>100 && mouseY<600) { //circle only works if within 25 of the line (y axis)
    sliderym=mouseY; //the circle will not go off the line
  }
 }
 
 void slideryb (int xt, int xb) {
    if (mouseX > xt && mouseX<xb && mouseY>100 && mouseY<600) { //circle only works if within 25 of the line (y axis)
    slideryb=mouseY; //the circle will not go off the line
  }
 }
  
