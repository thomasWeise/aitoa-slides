package aitoa.algorithms;

public class EAWithClearing<X, Y> implements IMetaheuristic<X, Y> {

  public void solve(IBlackBoxProcess<X, Y> process) {
    Random                    random      = process.getRandom();
    ISpace<X>                 searchSpace = process.getSearchSpace();
    INullarySearchOperator<X> nullary     = process.getNullarySearchOperator();
    IUnarySearchOperator<X>   unary       = process.getUnarySearchOperator();
    IBinarySearchOperator<X>  binary      = process.getBinarySearchOperator();
    Individual<X>[]           P           = new Individual[this.mu + this.lambda];

    for (int i = P.length; (--i) >= 0;) { // first generation: fill P with random points
      X x  = searchSpace.create(); // allocate point
      nullary.apply(x, random);    // fill with random data
      P[i] = new Individual<>(x, process.evaluate(x)); // evaluate
      if (process.shouldTerminate()) return; 
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
