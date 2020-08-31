package aitoa.algorithms;

public class HillClimberWithRestarts<X, Y> extends Metaheuristic1<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
    X xCur  = process.getSearchSpace().create();
    X xBest = process.getSearchSpace().create();
    Random random = process.getRandom();

//
    this.nullary.apply(xBest, random); // sample random solution
    double fBest       = process.evaluate(xBest); // evaluate it
//

//
    this.unary.apply(xBest, xCur, random); // try to improve
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
