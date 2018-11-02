Heap h;

void setup() {
  size(400, 400);
  h = new Heap();
  println(h);
}

void draw() {
  background(51);
  h.display();
}
