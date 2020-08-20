package aitoa.examples.jssp;

public class JSSPUnaryOperatorNSwap implements IUnarySearchOperator<int[]> {
// unnecessary stuff omitted here...
  public void apply(int[] x, int[] dest, Random random) {
    System.arraycopy(x, 0, dest, 0, x.length); // copy x to dest
    int i     = random.nextInt(dest.length);   // index of first job to swap
    int first = dest[i];
//
//
//
//
//
    int j    = random.nextInt(dest.length);
    int jobJ = dest[j];
    if (first != jobJ) {
//
      dest[i] = jobJ; // overwrite job at index i with jobJ
      i       = j; // remember index j: we will overwrite it next
//
//
    }
//
//

    dest[i] = first; // write back first id to last copied index
  }
}