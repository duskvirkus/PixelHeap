class Heap {
  
  private Pixel[] tree;
  
  private int added = 0;
  private int removed = 0;
  
  protected HeapType heapType = HeapType.MAX;
  
  public Heap() {
    this(16, HeapType.MAX);
  }
  
   public Heap(int startingSize) {
    this(startingSize, HeapType.MAX);
  }
  
  public Heap(HeapType heapType) {
    this(16, heapType);
  }
  
  public Heap(int startingSize, HeapType heapType) {
    tree = new Pixel[startingSize];
    this.heapType = heapType;
  }
  
  public void add(Pixel pixel) {
    if (size() >= tree.length) {
      reallocate();
    }
    tree[size()] = pixel;
    bubbleUp(size());
    added++;
  }
  
  private void reallocate() {
    Pixel[] newTree = new Pixel[tree.length * 2];
    for (int i = 0; i < size(); i++) {
      newTree[i] = tree[i];
    }
    tree = newTree;
  }
  
  public Pixel peek() {
    return tree[0];
  }
  
  public Pixel poll() {
    if (tree[0] == null) {
      return null;
    } else {
      Pixel element = tree[0];
      tree[0] = tree[size() - 1];
      tree[size() - 1] = null;
      removed++;
      bubbleDown(0);
      return element;
    }
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
  
  private void bubbleDown(int i) {
    if (leftChild(i) < size()) {
      if (rightChild(i) < size()) {
        if (tree[leftChild(i)].compareTo(tree[rightChild(i)]) > 0) {
          if (heapType == HeapType.MAX && tree[i].compareTo(tree[leftChild(i)]) < 0 || heapType == HeapType.MIN && tree[i].compareTo(tree[leftChild(i)]) > 0) {
            Pixel temp = tree[leftChild(i)];
            tree[leftChild(i)] = tree[i];
            tree[i] = temp;
            bubbleDown(leftChild(i));
          }
        } else {
          if (heapType == HeapType.MAX && tree[i].compareTo(tree[rightChild(i)]) < 0 || heapType == HeapType.MIN && tree[i].compareTo(tree[rightChild(i)]) > 0) {
            Pixel temp = tree[rightChild(i)];
            tree[rightChild(i)] = tree[i];
            tree[i] = temp;
            bubbleDown(rightChild(i));
          }
        }
      } else {
        if (heapType == HeapType.MAX && tree[i].compareTo(tree[leftChild(i)]) < 0 || heapType == HeapType.MIN && tree[i].compareTo(tree[leftChild(i)]) > 0) {
            Pixel temp = tree[leftChild(i)];
            tree[leftChild(i)] = tree[i];
            tree[i] = temp;
            bubbleDown(leftChild(i));
          }
      }
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
