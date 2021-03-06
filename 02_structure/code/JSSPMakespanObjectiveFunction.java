package aitoa.examples.jssp;

public class JSSPMakespanObjectiveFunction
    implements IObjectiveFunction<JSSPCandidateSolution> {
  
/** Some stuff that is not relevant here has been omitted.
    You can find it in the full code online. */
  
  public double evaluate(final JSSPCandidateSolution y) {
    int makespan = 0; // biggest end time
    for (int[] machine : y.schedule) {
      int end = machine[machine.length - 1];
      if (end > makespan) { // this machine ends later
        makespan = end; // remember biggest end time
      }
    }
    return makespan;
  } 
}
