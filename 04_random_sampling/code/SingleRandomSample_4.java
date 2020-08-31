package aitoa.algorithms;

public class SingleRandomSample<X, Y> extends Metaheuristic0<X, Y> {
// unnecessary stuff (e.g., constructor) omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
    X x = process.getSearchSpace().create(); // allocate

    this.nullary.apply(x, process.getRandom()); 

//
  }
}
