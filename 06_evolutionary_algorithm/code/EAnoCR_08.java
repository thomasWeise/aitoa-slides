package aitoa.algorithms;

public class EA<X, Y> implements IMetaheuristic<X, Y> {
// abridged code: unnecessary stuff omitted here and in function solve...
  public void solve(final IBlackBoxProcess<X, Y> process) {
    Random                    random      = process.getRandom();
    ISpace<X>                 searchSpace = process.getSearchSpace();
    INullarySearchOperator<X> nullary     = process.getNullarySearchOperator();
    IUnarySearchOperator<X>   unary       = process.getUnarySearchOperator();
    Individual<X>[]           P           = new Individual[this.mu + this.lambda];

    for (int i = P.length; (--i) >= 0;) { // first generation: fill P with random points
//
//
//
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
  } // end solve
} // end class
