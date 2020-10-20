package aitoa.algorithms;

public class EAWithClearing<X, Y> extends Metaheuristic2<X, Y> {

  public void solve(IBlackBoxProcess<X, Y> process) {
    Random      random      = process.getRandom();
    ISpace<X>   searchSpace = process.getSearchSpace();
    Record<X>[] P           = new Record[this.mu + this.lambda];

    for (int i = P.length; (--i) >= 0;) { // first generation: fill P with random points
      X x  = searchSpace.create();   // allocate point
      this.nullary.apply(x, random); // fill with random data
      P[i] = new Record<>(x, process.evaluate(x)); // evaluate
// 
    } // end of filling the first population

//
//
//
//
//
//
//        
//
//
//
//
//
//
//
//
//
//
//
//
//
  } // end solve
} // end class
