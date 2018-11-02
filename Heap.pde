class Heap {
  
  protected Pixel[] tree;
  
  protected int added = 0;
  protected int removed = 0;
  
  public Heap() {
    this(16);
  }
  
  public Heap(int startingSize) {
    tree = new Pixel[startingSize];
  }
  
  public void add(Pixel pixel) {
    if (size() < tree.length) {
      tree[size()] = pixel;
    }
    added++;
  }
  
  public void display() {
    int rows = 3;
    int rowHeight = height / rows;
    for (int i = 0; i < rows; i++) {
      rect(0, rowHeight * i, width, rowHeight);
    }
  }
  
  public int size() {
    return added - removed;
  }
  
  public String toString() {
    String s = "[";
    for (int i = 0; i < size() - 1; i++) {
      s += tree[i] + ", ";
    }
    return s += tree[size() - 1] + "]";
  }
  
}
