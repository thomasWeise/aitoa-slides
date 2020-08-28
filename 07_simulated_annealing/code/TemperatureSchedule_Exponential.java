package aitoa.algorithms;

public class Exponential extends TemperatureSchedule {
// unnecessary things omitted here
  public final double epsilon;

  public double temperature(long tau) {
    // (*@\listingCommentFormat{$T(\iteration) = T_s * (1 - \epsilon) ^ {\iteration - 1}$}@*)
    return (this.startTemperature * Math.pow((1d - this.epsilon), (tau - 1L)));
  }  
}
