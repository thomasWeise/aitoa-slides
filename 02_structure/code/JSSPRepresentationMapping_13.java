package aitoa.examples.jssp;

public class JSSPRepresentationMapping
               implements IRepresentationMapping<int[], JSSPCandidateSolution> {
// omitted useless stuff, like member variable "instance"
  public void map(int[] x, JSSPCandidateSolution y) {
    int[] machineState = new int[this.instance.m]; // These variables can be member
    int[] machineTime  = new int[this.instance.m]; // variables that only need to be
    int[] jobState     = new int[this.instance.n]; // filled with 0. Then we avoid
    int[] jobTime      = new int[this.instance.n]; // allocating them each time.

    for (int nextJob : x) { // iterate over job IDs in x
      int[] jobSteps = this.instance.jobs[nextJob]; // get the operations of the job
      int   jobStep  = (jobState[nextJob]++) << 1;  // 2*(increased job step index)
      int   machine  = jobSteps[jobStep];           // get the machine to use

      int   start      = Math.max(machineTime[machine], jobTime[nextJob]);
      int   end        = start + jobSteps[jobStep + 1]; // begin + operation time
      jobTime[nextJob] = machineTime[machine] = end;

      int[] schedule = y.schedule[machine]; // get list of tasks for machine
//
//
//
    } // end iteration over job IDs
  } // end function
} // end abridged class
