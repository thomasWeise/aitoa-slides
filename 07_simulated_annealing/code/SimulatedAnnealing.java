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
    long   tau  = 1L;                     // initialize step counter to 1

    do { // repeat until budget exhausted
      this.unary.apply(xCur, xNew, random); // create modified copy xNew of xCur
      ++tau; // increase step counter
      double fNew = process.evaluate(xNew); // map xNew from (*@\listingCommentFormat{$\searchSpace$}@*) to (*@\listingCommentFormat{$\solutionSpace$}@*) and evaluate result
      if ((fNew <= fCur) || // accept if new solution is better solution OR
          (random.nextDouble() < // probability is (*@\listingCommentFormat{$\exp{(-\Delta E/T)}$}@*) using (*@\listingCommentFormat{$-\Delta E = -(fNew-fCur)$}@*)
             Math.exp((fCur - fNew) / this.schedule.temperature(tau)))) {
        fCur = fNew; // update current objective value
        process.getSearchSpace().copy(xNew, xCur); // copy xNew to xCur
      } // otherwise fNew > fCur and not accepted
    } while (!process.shouldTerminate()); // until time is up
  } // process will have automatically remembered the best candidate solution
}
