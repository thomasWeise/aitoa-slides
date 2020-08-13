package aitoa.examples.jssp;

public class JSSPUnaryOperator1Swap implements IUnarySearchOperator<int[]> {
// unnecessary stuff omitted here...
  public void apply(int[] x, int[] dest, Random random) {
// copy the source point in search space to the dest
    System.arraycopy(x, 0, dest, 0, x.length);

// choose the index of the first sub-job to swap
    int i    = random.nextInt(dest.length);
    int jobI = dest[i]; // remember job id

    for (;;) { // try to find a location j with a different job
      int j = random.nextInt(dest.length);
      int jobJ = dest[j];
      if (jobI != jobJ) { // we found two locations with two
        dest[i] = jobJ;   // different values
        dest[j] = jobI;   // then we swap the values
        return;           // and are done
      }
    }
  }
}
