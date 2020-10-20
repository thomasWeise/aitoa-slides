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
      if (process.shouldTerminate()) return; 
    } // end of filling the first population

//
    RandomUtils.shuffle(random, P, 0, P.length); // make fair
    int u = Utils.qualityBasedClearing(P, this.mu);
    RandomUtils.shuffle(random, P, 0, u); // for fairness
    int p1 = -1; // index to iterate over first parent
    for (int index = P.length; (--index) >= u;) { // overwrite non-unique and worst
      if (process.shouldTerminate()) return;        
      Record<X> dest = P[index];
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
    } // the end of the offspring generation
//
  } // end solve
} // end class
