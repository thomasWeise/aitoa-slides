package aitoa.algorithms;

public class Individual<X> implements Supplier<X> {
  
  public static final Comparator<Individual<?>> BY_QUALITY =
      (a, b) -> Double.compare(a.quality, b.quality);

  public X      x;
  public double quality;
  
// unnecessary stuff omitted here...
}
