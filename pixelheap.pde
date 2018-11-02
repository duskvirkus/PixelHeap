Heap h;

void setup() {
  size(400, 400);
  h = new Heap();
  for (int i = 0; i < 100; i++) {
    h.add(new Pixel(color(random(255))));
  }
  //println(h);
  for (int i = 0; i < 100; i++) {
    println(h.poll());
  }
  //println(h);
}

void draw() {
  background(51);
}
