function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = rstar_afe_forecast.static_resid_tt(T, y, x, params);
end
residual = zeros(16, 1);
lhs = y(14);
rhs = params(11)+400*y(8);
residual(1) = lhs - rhs;
lhs = y(15);
rhs = params(9)+400*y(4);
residual(2) = lhs - rhs;
lhs = y(16);
rhs = params(9)+params(10)+400*y(6);
residual(3) = lhs - rhs;
lhs = y(1);
rhs = y(1)-(y(6)-y(4)-y(12))*T(4);
residual(4) = lhs - rhs;
lhs = y(10);
rhs = y(1)+T(3)*(y(2)-y(11))+params(1)*T(3)*(y(10)-T(3)*y(10));
residual(5) = lhs - rhs;
lhs = y(5);
rhs = y(6)-y(4);
residual(6) = lhs - rhs;
lhs = y(3);
rhs = y(7)+params(1)*y(3)+params(3)*(y(10)*params(2)+T(2)*y(1));
residual(7) = lhs - rhs;
lhs = y(4);
rhs = y(3)+y(4)*params(5);
residual(8) = lhs - rhs;
lhs = y(10);
rhs = y(2)-y(11);
residual(9) = lhs - rhs;
lhs = y(12);
rhs = y(8)+y(9);
residual(10) = lhs - rhs;
lhs = y(13);
rhs = y(4)+y(12);
residual(11) = lhs - rhs;
lhs = y(11)*params(2)+T(2)*(y(11)-T(3)*y(11))-(y(11)-T(3)*y(11))*T(3)*params(1)*T(2);
rhs = (params(1)*y(8)-y(8))*T(2)*T(3)+y(9)*params(1)*T(3)/(1-params(1)*T(3));
residual(12) = lhs - rhs;
lhs = y(6);
rhs = y(6)*params(6)+(1-params(6))*(y(4)*params(7)+y(10)*params(8)/4)+params(18)/400*x(1);
residual(13) = lhs - rhs;
lhs = y(9);
rhs = y(9)*params(12)+params(15)/400*x(3);
residual(14) = lhs - rhs;
lhs = y(8);
rhs = y(8)*params(13)+params(16)/400*x(4);
residual(15) = lhs - rhs;
lhs = y(7);
rhs = y(7)*params(14)+params(17)/400*x(2);
residual(16) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
