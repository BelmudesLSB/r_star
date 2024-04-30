function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(25)=params(12)*y(9)+params(15)/400*x(3);
  y(24)=params(13)*y(8)+params(16)/400*x(4);
  y(23)=params(14)*y(7)+params(17)/400*x(2);
end
