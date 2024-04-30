function [y, T, residual, g1] = dynamic_4(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  residual(1)=(y(26))-(y(18)-y(27));
  T(3)=T(2)^(-1);
  residual(2)=(y(17))-(y(33)-(y(22)-y(36)-y(28))*T(3));
  residual(3)=(y(20))-(y(19)+params(5)*y(4));
  residual(4)=(y(22))-(params(6)*y(6)+(1-params(6))*(y(20)*params(7)+y(26)*params(8)/4)+params(18)/400*x(1));
  residual(5)=(y(19))-(y(23)+params(1)*y(35)+params(3)*(y(26)*params(2)+y(17)*T(2)));
  residual(6)=(y(26))-(y(17)+(y(2)-y(11))*params(4)/T(1)+params(1)*params(4)/T(1)*(y(42)-y(26)*params(4)/T(1)));
if nargout > 3
    g1_v = NaN(21, 1);
g1_v(1)=(-(params(4)/T(1)));
g1_v(2)=(-params(6));
g1_v(3)=(-params(5));
g1_v(4)=(-1);
g1_v(5)=T(3);
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-((1-params(6))*params(7)));
g1_v(9)=1;
g1_v(10)=(-((1-params(6))*params(8)/4));
g1_v(11)=(-(params(3)*params(2)));
g1_v(12)=1-params(1)*params(4)/T(1)*(-(params(4)/T(1)));
g1_v(13)=(-1);
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=(-(params(3)*T(2)));
g1_v(17)=(-1);
g1_v(18)=(-T(3));
g1_v(19)=(-(params(1)*params(4)/T(1)));
g1_v(20)=(-params(1));
g1_v(21)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
