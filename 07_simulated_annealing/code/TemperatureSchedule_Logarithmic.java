package aitoa.algorithms;

public class Logarithmic extends TemperatureSchedule { 
// unnecessary things omitted here  
  public final double epsilon;
  
  public double temperature(long tau) {
    if (tau >= Long.MAX_VALUE) { // ensure (*@\listingCommentFormat{$\lim_{\iteration\rightarrow\infty} T(\iteration) = 0$}@*)
      return 0d;
    }
    
    // (*@\listingCommentFormat{$T(\iteration) = \frac{T_s}{\ln{\left(\epsilon(\iteration-1)+e\right)}}$}@*)
    return (this.startTemperature / Math.log(((tau - 1L) * this.epsilon) + Math.E));
  }  
}