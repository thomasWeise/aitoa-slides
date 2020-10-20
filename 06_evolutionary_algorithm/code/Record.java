package aitoa.structure;

public class Record<X> {

  /** The comparator to be used for sorting according quality */
  public static final Comparator<Record<?>> BY_QUALITY =
      (a, b) -> Double.compare(a.quality, b.quality);

  /** the point in the search space */
  public final X x;
  /** the quality */
  public double quality;
  
// unnecessary stuff omitted here...
}
