package aitoa.algorithms;

public class SimulatedAnnealing<X, Y> extends Metaheuristic1<X, Y> {
// unnecessary things omitted
  public void solve(IBlackBoxProcess<X, Y> process) {
    X xNew = process.getSearchSpace().create();
    X xCur = process.getSearchSpace().create();
    Random random = process.getRandom();// get random number generator

// create starting point: a random point in the search space
    this.nullary.apply(xCur, random);     // put random point in xCur
    double fCur = process.evaluate(xCur); // map xCur to (*@\listingCommentFormat{$\solutionSpace$}@*) and evaluate objective (*@\listingCommentFormat{$\objf$}@*)
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
  } // process will have automatically remembered the best candidate solution
}
