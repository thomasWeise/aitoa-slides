package aitoa.algorithms;

public abstract class TemperatureSchedule {
// unnecessary things omitted here
  public final double startTemperature; // (*@\listingCommentFormat{$\equiv\;T_s$}@*)

  public abstract double temperature(long tau); // (*@\listingCommentFormat{$\equiv\;T(\iteration)$}@*)

}
