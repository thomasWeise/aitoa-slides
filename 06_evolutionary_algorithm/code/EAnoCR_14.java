package aitoa.algorithms;

public class EA<X, Y> extends Metaheuristic2<X, Y> {
// abridged code: unnecessary stuff omitted here and in function solve...
  public void solve(IBlackBoxProcess<X, Y> process) {
    Random          random      = process.getRandom();
    ISpace<X>       searchSpace = process.getSearchSpace();
    Individual<X>[] P           = new Individual[this.mu + this.lambda];

    for (int i = P.length; (--i) >= 0;) { // first generation: fill P with random points
      X x  = searchSpace.create();   // allocate point
      this.nullary.apply(x, random); // fill with random data
      P[i] = new Individual<>(x, process.evaluate(x)); // evaluate
      if (process.shouldTerminate()) return; 
    } // end of filling the first population

//
    Arrays.sort(P, Individual.BY_QUALITY); // sort the population: mu best at front
    RandomUtils.shuffle(random, P, 0, this.mu); // shuffle parents for fairness
    int p1 = -1; // index to iterate over first parent
    for (int index = P.length; (--index) >= this.mu;) { // overwrite lambda worst
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
