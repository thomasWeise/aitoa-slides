package aitoa.algorithms;

public class Exponential extends TemperatureSchedule {
// unnecessary things omitted here
  public final double epsilon; // (*@\listingCommentFormat{$\equiv\;\varepsilon$}@*)

  public double temperature(long tau) {
    // (*@\listingCommentFormat{$T(\iteration) = T_s * (1 - \varepsilon) ^ {\iteration - 1}$}@*)
    return (this.startTemperature * Math.pow((1d - this.epsilon), (tau - 1L)));
  }  
}
