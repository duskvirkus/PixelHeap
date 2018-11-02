class Pixel implements Comparable<Pixel> {
  
  protected int c;
  
  public Pixel(color c) {
    this.c = c;
  }
  
  public int compareTo(Pixel other) {
    return int(brightness(c) - brightness(other.c));
  }
  
}
