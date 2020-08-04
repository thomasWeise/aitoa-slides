package aitoa.structure;

public interface IUnarySearchOperator<X> {

  void apply(X x, X dest, Random random);

}