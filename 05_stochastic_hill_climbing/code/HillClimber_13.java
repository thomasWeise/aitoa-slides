package aitoa.algorithms;

public class HillClimber<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
     X xCur  = process.getSearchSpace().create();
     X xBest = process.getSearchSpace().create();
     INullarySearchOperator<X> nullary = process.getNullarySearchOperator();
     IUnarySearchOperator<X>   unary   = process.getUnarySearchOperator();
     Random random = process.getRandom();
     
     nullary.apply(xBest, random);
     double fBest = process.evaluate(xBest);

//
     unary.apply(xBest, xCur, random);
     double fCur = process.evaluate(xCur);
     if (fCur < fBest) {
       fBest = fCur;
//
     }
//
  }
}
