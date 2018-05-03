
PImage [] img = new PImage[2];
int direction = 2;

float signal;

void setup() {
  size(1000, 600);
  stroke(255);
  img[0] = loadImage("thecity0.jpg");
  img[1] = loadImage("winchesterhouse1.jpg");
  img[0].loadPixels();
  loadPixels();
}

void draw() {
 
  if (signal > img[0].height-2 || signal < 0) { 
    direction = direction * -2;
  }
  if (mousePressed == true) {
    signal = abs(mouseY % img[0].height);
  } 
  else {
    signal += (0.2*direction);
  }

  if (keyPressed == true) {
    set(0, 0, img[0]);
    line(0, signal, img[0].width, signal);
  } 
  else {
    int signalOffset = int(signal)*img[0].width;
    for (int y = 0; y < img[1].height; y++) {
      arrayCopy(img[1].pixels, signalOffset, pixels, y*width, img[1].width);
    } 
    updatePixels();
  }
}
