package aitoa.algorithms;

public class EA<X, Y> extends Metaheuristic2<X, Y> {
// abridged code: unnecessary stuff omitted here and in function solve...
  public void solve(IBlackBoxProcess<X, Y> process) {
    Random      random      = process.getRandom();
    ISpace<X>   searchSpace = process.getSearchSpace();
    Record<X>[] P           = new Record[this.mu + this.lambda];

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
