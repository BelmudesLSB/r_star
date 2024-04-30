function [y, T] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(31)=params(9)+400*y(20);
  y(32)=params(9)+params(10)+400*y(22);
  y(30)=params(11)+400*(y(18)-y(2)+y(24));
  y(29)=y(36)+y(28);
  y(21)=y(22)-y(36);
end
