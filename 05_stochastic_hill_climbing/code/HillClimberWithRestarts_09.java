package aitoa.algorithms;

public class HillClimberWithRestarts<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary stuff omitted here...
//

  public void solve(IBlackBoxProcess<X, Y> process) {
    X xCur  = process.getSearchSpace().create();
    X xBest = process.getSearchSpace().create();
    INullarySearchOperator<X> nullary = process.getNullarySearchOperator();
    IUnarySearchOperator<X>   unary   = process.getUnarySearchOperator();
    Random                    random  = process.getRandom();

//
    nullary.apply(xBest, random); // sample random solution
    double fBest       = process.evaluate(xBest); // evaluate it
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
  } // process has stored best-so-far result
}