package aitoa.examples.jssp;

public class JSSPBinaryOperatorSequence implements IBinarySearchOperator<int[]> {  
  public void apply(int[] x0, int[] x1, int[] dest, Random random) {
    boolean[] doneX0 = new boolean[x0.length]; // can be stored as reuseable
    boolean[] doneX1 = new boolean[x0.length]; // member variable instead

    int length = doneX0.length; // length = m*n
    int desti  = 0;             // all array indexes = 0
    int x0i    = 0;             // index of first unfinished operation in x0
    int x1i    = 0;             // index of first unfinished operation in x1
    
    for (;;) { // repeat until dest is filled, i.e., desti=length
// randomly chose a source point and pick next operation from it
      int add = random.nextBoolean() ? x0[x0i] : x1[x1i];
      dest[desti++] = add; // we picked a operation and added it
      if (desti >= length) return;

      for (int i = x0i;; i++) { // mark the operation as done in x0
        if ((x0[i] == add) && (!doneX0[i])) { // find added job
          doneX0[i] = true; // found it and marked it
          break; // quit operation finding loop
        }
      }
      while (doneX0[x0i]) x0i++; // move x0i to first unfinished operation in x0

      for (int i = x1i;; i++) { // mark the operation as done in x1
        if ((x1[i] == add) && (!doneX1[i])) { // find added job
          doneX1[i] = true; // found it and marked it
          break; // quit operation finding loop
        }
      }
      while (doneX1[x1i]) x1i++; // move x1i to first unfinished operation in x1
    } // loop back to main loop and to add next operation
  } // end of function
}