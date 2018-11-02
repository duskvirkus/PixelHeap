Heap h;

void setup() {
  size(400, 400);
  h = new Heap(100);
  for (int i = 0; i < 12; i++) {
    h.add(new Pixel(color(random(255))));
  }
  println(h);
  for (int i = 0; i < 6; i++) {
    println(h.poll());
  }
  println(h);
}

void draw() {
  background(51);
  h.display();
}
