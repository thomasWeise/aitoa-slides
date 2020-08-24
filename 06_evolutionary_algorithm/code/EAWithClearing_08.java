package aitoa.algorithms;

public class EAWithClearing<X, Y> implements IMetaheuristic<X, Y> {

  public void solve(IBlackBoxProcess<X, Y> process) {
    Random                    random      = process.getRandom();
    ISpace<X>                 searchSpace = process.getSearchSpace();
    INullarySearchOperator<X> nullary     = process.getNullarySearchOperator();
    IUnarySearchOperator<X>   unary       = process.getUnarySearchOperator();
    IBinarySearchOperator<X>  binary      = process.getBinarySearchOperator();
    Individual<X>[]           P           = new Individual[this.mu + this.lambda];

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
//
//
//
//
//
//
  } // end solve
} // end class
