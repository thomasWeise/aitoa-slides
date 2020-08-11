package aitoa.algorithms;

public class HillClimber<X, Y> implements IMetaheuristic<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
     final X xCur  = process.getSearchSpace().create();
     final X xBest = process.getSearchSpace().create();
     final INullarySearchOperator<X> nullary = process.getNullarySearchOperator();
     final IUnarySearchOperator<X>   unary   = process.getUnarySearchOperator();
     final Random random = process.getRandom();
     
     nullary.apply(xBest, random);
     double fBest = process.evaluate(xBest);

     while (!process.shouldTerminate()) {
       unary.apply(xBest, xCur, random);
       double fCur = process.evaluate(xCur);
       if (fCur < fBest) {
         fBest = fCur;
         process.getSearchSpace().copy(xCur, xBest);
       }
     }
  }
}