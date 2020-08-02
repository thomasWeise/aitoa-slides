package aitoa.examples.jssp;

public final class JSSPRepresentationMapping implements
    IRepresentationMapping<int[], JSSPCandidateSolution> {

  public void map(int[] x, JSSPCandidateSolution y) {
    int[] machineState = this.m_machineState; int[] machineTime = this.m_machineTime;
    int[] jobState = this.m_jobState;         int[] jobTime = this.m_jobTime;
    Arrays.fill(machineState, 0);             Arrays.fill(jobState, 0);
    Arrays.fill(machineTime, 0);              Arrays.fill(jobTime, 0);

    for (final int nextJob : x) {
      int[] jobSteps = this.m_jobs[nextJob];
      int   jobStep  = (jobState[nextJob]++) << 1;
      int   machine  = jobSteps[jobStep];

      int   start      = Math.max(machineTime[machine], jobTime[nextJob]);
      int   end        = start + jobSteps[jobStep + 1];
      jobTime[nextJob] = machineTime[machine] = end;

      int[] schedule = y.schedule[machine];
      schedule[machineState[machine]++] = nextJob;
      schedule[machineState[machine]++] = start;
      schedule[machineState[machine]++] = end;
    }
  }
}