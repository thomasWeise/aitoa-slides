package aitoa.algorithms;

public class Utils {
// useless stuff omitted
  public static int qualityBasedClearing(Record<?>[] array, int max) {
    Arrays.sort(array, Record.BY_QUALITY); // best -> first
    
    int    unique      = 0;
    double lastQuality = Double.NEGATIVE_INFINITY; // impossibly bad

    for (int index = 0; index < array.length; index++) {
      Record<?> current        = array[index];
      double    currentQuality = current.quality;
      if (currentQuality > lastQuality) { // unique so-far
        if (index > unique) { // need to move forward?
          Record<?> other = array[unique];
          array[unique]   = current; // swap with first non-unique
          array[index]    = other;
        }
//
//
//
//
      }
    }
//
  }
}
