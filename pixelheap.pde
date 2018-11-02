Heap h;

void setup() {
  size(400, 400);
  h = new Heap();
  for (int i = 0; i < 12; i++) {
    h.add(new Pixel(color(random(255))));
  }
  println(h);
}

void draw() {
  background(51);
  h.display();
}
