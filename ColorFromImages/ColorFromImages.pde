 
PImage stoneheart;
PFont myFont;
 
void setup() {
  size(900,900);
  background(180);
  smooth();
  stoneheart = loadImage("voto.png");
   
  // create a Font to display text
  myFont = createFont ("Helvetica",24);
};
   
void draw() {
  background(180);
  // drawthe image to the stage
  image(stoneheart, width/2-stoneheart.width/2, height/2-stoneheart.height/2);
  // find the color under the mouse
  color mouseColor = get(mouseX, mouseY);
  //draw a rectangle filled with that color;
  fill(mouseColor);
  noStroke();
  rect(100,250,50,100);
   
 
  // ad3d the text labels
  //red
  fill(255,0,0);
  textFont(myFont);
  textSize(16);
  //red
  text(round(red(mouseColor)), 400,100);
  //green
  fill(0,255,0);
  text(round(green(mouseColor)), 400, 150);
  //blue
  fill(0,0,255);
  text(round(blue(mouseColor)), 400, 200);
  //hex value
  fill(255);
  text(hex(mouseColor), 400, 850);
};

