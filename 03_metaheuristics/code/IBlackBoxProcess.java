package aitoa.structure;

public interface IBlackBoxProcess<X, Y> extends
    IObjectiveFunction<X>, // evaluate works on (*@\listingCommentFormat{$\sespel\in\searchSpace$}@*) and performs (*@\listingCommentFormat{$\repMap$}@*) 
    ITerminationCriterion, // shouldTerminate() tells when to stop
    Closeable { // when closed, can write log file with trace

  Random getRandom(); // replicable random numbers
// ...
  double getBestF();     // get (current best or end) quality
  void getBestX(X dest); // get (current best or end) (*@\listingCommentFormat{$\sespel\in\searchSpace$}@*)
  void getBestY(Y dest); // get (current best or end) (*@\listingCommentFormat{$\solspel\in\solutionSpace$}@*)
// ...
  long getConsumedFEs();       // get number of calls to evaluate
  long getLastImprovementFE(); // get last FE when improved

/** Some stuff that is not relevant here has been omitted.
    You can find it in the full code online. */
}

