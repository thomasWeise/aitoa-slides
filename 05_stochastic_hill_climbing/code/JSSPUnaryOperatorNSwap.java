package aitoa.examples.jssp;

public class JSSPUnaryOperatorNSwap implements IUnarySearchOperator<int[]> {
//unnecessary stuff omitted here...
  public void apply(int[] x, int[] dest, Random random) {
    System.arraycopy(x, 0, dest, 0, x.length); // copy x to dest
    int i     = random.nextInt(dest.length);   // index of first job to swap
    int first = dest[i];
    int last  = first;   // last stores the job id to "swap in"
    boolean hasNext;
    do { // we repeat a geometrically distributed number of times
      hasNext = random.nextBoolean();
      inner: for (;;) { // find a location with a different job
        int j    = random.nextInt(dest.length);
        int jobJ = dest[j];
        if ((last != jobJ) && // don't swap job with itself
            (hasNext || (first != jobJ))) { // also not at end
          dest[i] = jobJ; // overwrite job at index i with jobJ
          i       = j; // remember index j: we will overwrite it next
          last    = jobJ; // but not with the same value jobJ...
          break inner;
        }
      }
    } while (hasNext); // Bernoulli process

    dest[i] = first; // write back first id to last copied index
  }
}