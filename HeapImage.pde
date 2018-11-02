import java.util.List;

class HeapImage {
  
  protected Heap[] heaps;
  
  protected int w = 0;
  protected int h = 0;
  
  public final HeapType heapType;
  
  public HeapImage(HeapType heapType, PImage firstImage) {
    this.heapType = heapType;
    addFirst(firstImage);
  }
  
  private void addFirst(PImage image) {
    w = image.width;
    h = image.height;
    assert w * h == image.pixels.length;
    heaps = new Heap[image.pixels.length];
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      heaps[i] = new Heap(heapType);
      heaps[i].add(new Pixel(image.pixels[i]));
    }
  }
  
  public void add(PImage image) {
    if (heaps.length == image.pixels.length) {
      image.loadPixels();
      for (int i = 0; i < heaps.length; i++) {
        heaps[i].add(new Pixel(image.pixels[i]));
      }
    } else {
      println("WARN: Image was not added to HeapImage because it was the wrong size.");
    }
  }
  
  public PImage getImage() {
    PImage image = createImage(w, h, ARGB);
    image.loadPixels();
    for (int i = 0; i < heaps.length; i++) {
      image.pixels[i] = heaps[i].poll().c;
    }
    image.updatePixels();
    return image;
  }
  
  public String toString() {
    String s = "[";
    for (int i = 0; i < heaps.length - 1; i++) {
      s += heaps[i] + ", ";
    }
    return s += heaps[heaps.length - 1] + "]";
  }
  
}
