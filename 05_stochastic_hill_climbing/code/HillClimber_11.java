package aitoa.algorithms;

public class HillClimber<X, Y> extends Metaheuristic1<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
     X xCur  = process.getSearchSpace().create();
     X xBest = process.getSearchSpace().create();
     Random random = process.getRandom();
     
     this.nullary.apply(xBest, random);
     double fBest = process.evaluate(xBest);

//
     this.unary.apply(xBest, xCur, random);
     double fCur = process.evaluate(xCur);
     if (fCur < fBest) {
       fBest = fCur;
//
     }
//
  }
}
