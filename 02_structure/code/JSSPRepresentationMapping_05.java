package aitoa.examples.jssp;

public class JSSPRepresentationMapping
               implements IRepresentationMapping<int[], JSSPCandidateSolution> {
// omitted useless stuff, like member variable "instance"
  public void map(int[] x, JSSPCandidateSolution y) {
    int[] machineState = new int[this.instance.m]; // These variables can be member
    int[] machineTime  = new int[this.instance.m]; // variables that only need to be
    int[] jobState     = new int[this.instance.n]; // filled with 0. Then we avoid
    int[] jobTime      = new int[this.instance.n]; // allocating them each time.

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
//
  } // end function
} // end abridged class
