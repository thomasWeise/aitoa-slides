package aitoa.structure;

public interface IBlackBoxProcess<X, Y> extends
    IObjectiveFunction<X>, ITerminationCriterion, Closeable {

  Random getRandom();
// ...
  ISpace<X> getSearchSpace();
  INullarySearchOperator<X> getNullarySearchOperator();
  IUnarySearchOperator<X> getUnarySearchOperator();
  IBinarySearchOperator<X> getBinarySearchOperator();
// ...
  double getBestF();
  void getBestX(X dest);
  void getBestY(Y dest);
// ...
  long getConsumedFEs();
  long getLastImprovementFE();

/** Some stuff that is not relevant here has been omitted.
    You can find it in the full code online. */
}
