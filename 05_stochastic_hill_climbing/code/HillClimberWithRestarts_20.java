package aitoa.algorithms;

public class HillClimberWithRestarts<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary stuff omitted here...
  public final long failsBeforeRestart;

  public void solve(IBlackBoxProcess<X, Y> process) {
    X xCur  = process.getSearchSpace().create();
    X xBest = process.getSearchSpace().create();
    INullarySearchOperator<X> nullary = process.getNullarySearchOperator();
    IUnarySearchOperator<X>   unary   = process.getUnarySearchOperator();
    Random                    random  = process.getRandom();

    while (!(process.shouldTerminate())) { // outer loop: restart
      nullary.apply(xBest, random); // sample random solution
      double fBest       = process.evaluate(xBest); // evaluate it
      long   failCounter = 0L; // initialize counters

      while (!(process.shouldTerminate())) { // inner loop
        unary.apply(xBest, xCur, random); // try to improve
        double fCur = process.evaluate(xCur); // evaluate
        if (fCur < fBest) { // we found a better solution
          fBest = fCur; // remember best quality
          process.getSearchSpace().copy(xCur, xBest); // copy
          failCounter = 0L; // reset number of unsuccessful steps
        } else { // ok, we did not find an improvement
//
//
//
        } // failure
      } // inner loop
    } // outer loop
  } // process has stored best-so-far result
}