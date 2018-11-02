HeapImage hi;

PImage i;

void setup() {
  size(474, 308);
  i = loadImage("data/Untitled-Cowboy-Prince.jpg");
  //i.resize(47, 30);
  hi = new HeapImage(HeapType.MAX, i);
  //println(hi);
}

void draw() {
  background(0);
  image(i, 0, 0);
}
