function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(1)=exp(params(11)/400);
  T(2)=T(1)/(T(1)-params(1)*params(4))*T(1)/(T(1)-params(4));
  residual(1)=(params(2)*y(27)+T(2)*(y(27)-y(11)*params(4)/T(1))-params(4)/T(1)*params(1)*T(2)*(y(43)-y(27)*params(4)/T(1)))-((params(1)*y(40)-y(24))*T(2)*params(4)/T(1)+y(41)*params(1)*params(4)/T(1)/(1-params(1)*params(4)/T(1)));
if nargout > 3
    g1_v = NaN(3, 1);
g1_v(1)=T(2)*(-(params(4)/T(1)));
g1_v(2)=params(2)+T(2)-params(4)/T(1)*params(1)*T(2)*(-(params(4)/T(1)));
g1_v(3)=(-(params(4)/T(1)*params(1)*T(2)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 3);
end
end
