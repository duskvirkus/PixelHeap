class Pixel implements Comparable<Pixel> {
  
  protected color c;
  
  public Pixel(color c) {
    this.c = c;
  }
  
  public int compareTo(Pixel other) {
    return int(brightness(c) - brightness(other.c));
  }
  
  public String toString() {
    return int(red(c)) + "-" + int(blue(c)) + "-" + int(green(c));
  }
  
}
