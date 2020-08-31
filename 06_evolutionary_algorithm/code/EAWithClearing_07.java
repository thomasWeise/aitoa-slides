package aitoa.algorithms;

public class EAWithClearing<X, Y> extends Metaheuristic2<X, Y> {

  public void solve(IBlackBoxProcess<X, Y> process) {
    Random          random      = process.getRandom();
    ISpace<X>       searchSpace = process.getSearchSpace();
    Individual<X>[] P           = new Individual[this.mu + this.lambda];

    for (int i = P.length; (--i) >= 0;) { // first generation: fill P with random points
      X x  = searchSpace.create(); // allocate point
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
//
//
//
//
//
//
//
  } // end solve
} // end class
