
float R, V; 
float valHue, valSatu, valBri;

void setup() {
  background(0,43,54);
  size(900, 500);
  
  R=150;
  V = 150;
  noStroke();
  colorMode(HSB, 1);
  
  translate(250, 250);

  float s, h; 
  for ( float x = -R; x < R; ++x) {
    for ( float y = -R; y < R; ++y) {
      s = sqrt(x * x + y * y) / R;
      if ( s <= 1 ) {
        h = (atan2(y, x) + PI) / TWO_PI;
        stroke(h, s, 1);
        point(x, y);
      }
    }
  }
}

void draw() {
  
  color mouseColor = get(mouseX, mouseY);
  fill(mouseColor);
  noStroke();
  ellipse(150, 70, 50, 50);
  
  //textSize(20);
  //fill(131, 148, 150);
  //text(valHue, 400,100);
};

void mouseClicked() {

  color mouseColor = get(mouseX, mouseY);
  noStroke();

  valHue = hue(mouseColor);
  valSatu = saturation(mouseColor);
  valBri = brightness(mouseColor);
  println(valHue + " " + valSatu+" "+ valBri+" ");

  fill(mouseColor);
  ellipse(640,250,250,250);
  
  for (float k = -V; k < V; ++k) {
    stroke(valHue, valSatu, map(k, -V, V, 0, 1));
    for(float j = 0; j < 20; ++j){
      point(k + 650, 410 + j);
    }
    
  }
}

