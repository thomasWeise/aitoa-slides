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
    double fCur = process.evaluate(xCur); // map xCur to (*@\listingCommentFormat{$\solutionSpace$}@*) and evaluate objective (*@\listingCommentFormat{$\objf$}@*)
    long   tau  = 1L;                     // initialize step counter to 1

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
