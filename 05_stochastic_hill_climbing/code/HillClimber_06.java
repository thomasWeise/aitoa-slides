package aitoa.algorithms;

public class HillClimber<X, Y> extends Metaheuristic1<X, Y> {
// unnecessary stuff omitted here...
  public void solve(IBlackBoxProcess<X, Y> process) {
     X xCur  = process.getSearchSpace().create();
     X xBest = process.getSearchSpace().create();
     Random random = process.getRandom();
     
     this.nullary.apply(xBest, random);
//

//
//
//
//
//
//
//
//
  }
}
