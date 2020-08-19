public class JSSPNullaryOperator implements INullarySearchOperator<int[]> {
// unnecessary stuff omitted here...
  public void apply(int[] dest, Random random) {
// fill first part of array with 0, 1, 2, ..., n
    for (int i = this.n; (--i) >= 0;) {
      dest[i] = i;
    }    
// copy this part m-1 times
    for (int i = dest.length; (i -= this.n) > 0;) {
      System.arraycopy(dest, 0, dest, i, this.n);
    }
//
//
//
//
//
//
//
  }
}
