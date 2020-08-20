package aitoa.algorithms;

public class SingleRandomSample<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
    X x = process.getSearchSpace().create(); // allocate

    process.getNullarySearchOperator().apply(x, process.getRandom()); 

//
  }
}