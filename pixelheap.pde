HeapImage hi;

PImage i1;
PImage i2;

void setup() {
  size(474, 308);
  i1 = loadImage("data/Untitled-Cowboy-Prince.jpg");
  i2 = loadImage("data/Untitled-Cowboy-Prince-Flipped.jpg");
  hi = new HeapImage(HeapType.MAX, i1);
  hi.add(i2);
}

void draw() {
  background(0);
  PImage out = hi.getImage();
  out.save("exports/Cowboy1.jpg");
  out = hi.getImage();
  out.save("exports/Cowboy2.jpg");
  image(out, 0, 0);
  noLoop();
}
