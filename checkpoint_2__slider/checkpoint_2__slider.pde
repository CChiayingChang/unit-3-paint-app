float sliderxm; //int can't store decimals, so we use float
float sliderxt;
float sliderxb;
color purple=#7402C6;
float r;
float g;
float b;

void setup () {
  size (700, 700);
  strokeWeight (5);
  fill (purple);
  stroke (purple);
  sliderxm=350;
  sliderxt=350;
  sliderxb=350;
  r=0;
  g=0;
  b=0;
}

void draw () {
  background (r, g, b);
   r=map(sliderxt, 100, 600, 0, 225); //(variable you're mapping from, then 2 numbers for the range of the variable, then the next 2 for range of what you want to convert it to
   g=map(sliderxm, 100, 600, 0, 225);
   b=map(sliderxb, 100, 600, 0, 225);
  
  slider (175, sliderxt);
  
  slider (350, sliderxm);
  
  slider (525, sliderxb);
}

void slider (int y, float slider) {
  line (100, y, 600, y);
  circle (slider, y, 50);
}

void mouseDragged () {//if you drag the mouse around it'll move
  sliderxt (150, 200);
  sliderxm (325, 375);
  sliderxb (500, 550);
}

//void sliderx (int yt, int yb, float whichslider) {
 // if (mouseX > 100 && mouseX<600 && mouseY>yt && mouseY<yb) { //circle only works if within 25 of the line (y axis)
   // whichslider=mouseX; //the circle will not go off the line
  //}
//}

 void sliderxt (int yt, int yb) {
    if (mouseX > 100 && mouseX<600 && mouseY>yt && mouseY<yb) { //circle only works if within 25 of the line (y axis)
    sliderxt=mouseX; //the circle will not go off the line
  }
 }
 
 void sliderxm (int yt, int yb) {
    if (mouseX > 100 && mouseX<600 && mouseY>yt && mouseY<yb) { //circle only works if within 25 of the line (y axis)
    sliderxm=mouseX; //the circle will not go off the line
  }
 }
 
 void sliderxb (int yt, int yb) {
    if (mouseX > 100 && mouseX<600 && mouseY>yt && mouseY<yb) { //circle only works if within 25 of the line (y axis)
    sliderxb=mouseX; //the circle will not go off the line
  }
 }
  
