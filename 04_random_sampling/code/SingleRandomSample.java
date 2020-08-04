package aitoa.algorithms;

public class SingleRandomSample<X, Y> implements IMetaheuristic<X, Y> {

  public void solve(IBlackBoxProcess<X, Y> process) {
    X x = process.getSearchSpace().create();

    process.getNullarySearchOperator().apply(x, process.getRandom());

    process.evaluate(x);
  }
}