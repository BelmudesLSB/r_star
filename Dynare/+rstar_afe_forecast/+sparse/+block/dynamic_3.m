function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(28)=y(40)+y(41)-params(2)*(y(43)-y(27));
end
