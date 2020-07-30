package aitoa.structure;

public interface IObjectiveFunction<Y> {

  public abstract double evaluate(Y y);

}