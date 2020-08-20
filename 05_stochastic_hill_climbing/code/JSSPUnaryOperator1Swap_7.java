package aitoa.examples.jssp;

public class JSSPUnaryOperator1Swap implements IUnarySearchOperator<int[]> {
// unnecessary stuff omitted here...
  public void apply(int[] x, int[] dest, Random random) {
// copy the source point in search space to the dest
    System.arraycopy(x, 0, dest, 0, x.length);

// choose the index of the first operation to swap
    int i    = random.nextInt(dest.length);
    int jobI = dest[i]; // remember job id

//
    int j = random.nextInt(dest.length);
    int jobJ = dest[j];
//
    dest[i] = jobJ;
    dest[j] = jobI;   // then we swap the values
//
//
//
  }
}
