package aitoa.algorithms;

public class RandomSampling<X, Y> extends Metaheuristic0<X, Y> {
// unnecessary stuff (e.g., constructor) omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
    X x = process.getSearchSpace().create();

    Random random = process.getRandom();

    do {
      this.nullary.apply(x, random);
      process.evaluate(x);
    } while (!process.shouldTerminate());
  }
}
