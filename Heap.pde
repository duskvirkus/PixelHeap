class Heap {
  
  private Pixel[] tree;
  
  private int added = 0;
  private int removed = 0;
  
  protected HeapType heapType = HeapType.MAX;
  
  public Heap() {
    this(16, HeapType.MAX);
  }
  
  public Heap(HeapType heapType) {
    this(16, heapType);
  }
  
  public Heap(int startingSize, HeapType heapType) {
    tree = new Pixel[startingSize];
    this.heapType = heapType;
  }
  
  public void add(Pixel pixel) {
    if (size() < tree.length) {
      tree[size()] = pixel;
    }
    bubbleUp(size());
    added++;
  }
  
  private int leftChild(int i) {
    return 2 * i + 1;
  }
  
  private int rightChild(int i) {
    return 2 * (i + 1);
  }
  
  private int parent(int i) {
    return (i - 1) / 2;
  }
  
  private void bubbleUp(int i) {
    if (parent(i) >= 0) {
      if (heapType == HeapType.MAX && tree[i].compareTo(tree[parent(i)]) > 0 || heapType == HeapType.MIN && tree[i].compareTo(tree[parent(i)]) < 0) { //<>//
        Pixel temp = tree[parent(i)];
        tree[parent(i)] = tree[i];
        tree[i] = temp;
        bubbleUp(parent(i));
      }
    }
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
