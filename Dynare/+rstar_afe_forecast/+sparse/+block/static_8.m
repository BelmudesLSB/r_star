function [y, T] = static_8(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(15)=params(9)+400*y(4);
  y(16)=params(9)+params(10)+400*y(6);
  y(5)=y(6)-y(4);
  y(13)=y(4)+y(12);
end
