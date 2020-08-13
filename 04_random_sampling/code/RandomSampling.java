package aitoa.algorithms;

public class RandomSampling<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
    X x = process.getSearchSpace().create();

    INullarySearchOperator<X> nullary = process.getNullarySearchOperator();
    Random random = process.getRandom();

    do {
      nullary.apply(x, random);
      process.evaluate(x);
    } while (!process.shouldTerminate());
  }
}
