package aitoa.structure;

public interface IObjectiveFunction<Y> {

  double evaluate(Y y);

}