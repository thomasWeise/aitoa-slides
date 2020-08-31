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

    while (!(process.shouldTerminate())) { // inner loop
      this.unary.apply(xBest, xCur, random); // try to improve
      double fCur = process.evaluate(xCur); // evaluate
      if (fCur < fBest) { // we found a better solution
        fBest = fCur; // remember best quality
        process.getSearchSpace().copy(xCur, xBest); // copy
//
      }
//
//
//
//
    } // inner loop
//
  } // process has stored best-so-far result
}
