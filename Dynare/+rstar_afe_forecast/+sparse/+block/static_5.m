function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(1)=exp(params(11)/400);
  T(2)=T(1)/(T(1)-params(1)*params(4))*T(1)/(T(1)-params(4));
  residual(1)=(y(11)*params(2)+T(2)*(y(11)-params(4)/T(1)*y(11))-(y(11)-params(4)/T(1)*y(11))*params(4)/T(1)*params(1)*T(2))-((params(1)*y(8)-y(8))*T(2)*params(4)/T(1)+y(9)*params(1)*params(4)/T(1)/(1-params(1)*params(4)/T(1)));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=params(2)+T(2)*(1-params(4)/T(1))-params(4)/T(1)*params(1)*T(2)*(1-params(4)/T(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
