package aitoa.algorithms;

public class SimulatedAnnealing<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary things omitted
  public void solve(IBlackBoxProcess<X, Y> process) {
    X xNew = process.getSearchSpace().create();
    X xCur = process.getSearchSpace().create();
    INullarySearchOperator<X> nullary = process.getNullarySearchOperator(); 
    IUnarySearchOperator<X>   unary   = process.getUnarySearchOperator();
    Random random = process.getRandom();// get random number generator

// create starting point: a random point in the search space
    nullary.apply(xCur, random);          // put random point in xCur
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
  }
}
