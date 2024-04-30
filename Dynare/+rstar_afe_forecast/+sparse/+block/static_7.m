function [y, T, residual, g1] = static_7(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  residual(1)=(y(3))-(y(7)+params(1)*y(3)+params(3)*(y(10)*params(2)+T(2)*y(1)));
  residual(2)=(y(4))-(y(3)+y(4)*params(5));
  residual(3)=(y(10))-(y(2)-y(11));
  T(3)=T(2)^(-1);
  residual(4)=(y(1))-(y(1)-(y(6)-y(4)-y(12))*T(3));
  residual(5)=(y(6))-(y(6)*params(6)+(1-params(6))*(y(4)*params(7)+y(10)*params(8)/4)+params(18)/400*x(1));
  residual(6)=(y(10))-(y(1)+params(4)/T(1)*(y(2)-y(11))+params(1)*params(4)/T(1)*(y(10)-params(4)/T(1)*y(10)));
if nargout > 3
    g1_v = NaN(15, 1);
g1_v(1)=(-(T(2)*params(3)));
g1_v(2)=(-1);
g1_v(3)=1-params(1);
g1_v(4)=(-1);
g1_v(5)=(-1);
g1_v(6)=(-(params(4)/T(1)));
g1_v(7)=1-params(5);
g1_v(8)=(-T(3));
g1_v(9)=(-((1-params(6))*params(7)));
g1_v(10)=T(3);
g1_v(11)=1-params(6);
g1_v(12)=(-(params(3)*params(2)));
g1_v(13)=1;
g1_v(14)=(-((1-params(6))*params(8)/4));
g1_v(15)=1-params(1)*params(4)/T(1)*(1-params(4)/T(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
