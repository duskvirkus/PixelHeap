HeapImage hi;

PImage[] images = new PImage[25];

void setup() {
  size(500, 500);
  loadImages();
  hi = new HeapImage(HeapType.MAX, images[0]);
  for (int i = 1; i < images.length; i++) {
    hi.add(images[i]);
  }
  PImage out;
  for (int i = 0; i < 25; i++) {
    out = hi.getImage();
    out.save("exports/bwblob/BWBlob-Processed-" + i + ".jpg");
  }
}

void draw() {
  background(0);
  text("DONE", width/2, height/2);
  noLoop();
}

void loadImages() {
  int i = 0;
  int j = 1;
  while (j < 50) {
    images[i] = loadImage("data/bwblob/BWBlob-" + j + ".jpg");
    i++;
    j += 2;
  }
}
