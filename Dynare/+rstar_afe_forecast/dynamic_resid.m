function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = rstar_afe_forecast.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(16, 1);
    residual(1) = (y(21)) - (params(11)+400*(y(9)-y(1)+y(15)));
    residual(2) = (y(22)) - (params(9)+400*y(11));
    residual(3) = (y(23)) - (params(9)+params(10)+400*y(13));
    residual(4) = (y(8)) - (y(24)-(y(13)-y(26)-y(19))*T(4));
    residual(5) = (y(17)) - (y(8)+(y(1)-y(7))*T(3)+params(1)*T(3)*(y(29)-y(17)*T(3)));
    residual(6) = (y(12)) - (y(13)-y(26));
    residual(7) = (y(10)) - (y(14)+params(1)*y(25)+params(3)*(y(17)*params(2)+y(8)*T(2)));
    residual(8) = (y(11)) - (y(10)+params(5)*y(2));
    residual(9) = (y(17)) - (y(9)-y(18));
    residual(10) = (y(19)) - (y(27)+y(28)-params(2)*(y(30)-y(18)));
    residual(11) = (y(20)) - (y(26)+y(19));
    residual(12) = (params(2)*y(18)+T(2)*(y(18)-y(7)*T(3))-T(3)*params(1)*T(2)*(y(30)-y(18)*T(3))) - ((params(1)*y(27)-y(15))*T(2)*T(3)+y(28)*params(1)*T(3)/(1-params(1)*T(3)));
    residual(13) = (y(13)) - (params(6)*y(3)+(1-params(6))*(y(11)*params(7)+y(17)*params(8)/4)+params(18)/400*x(it_, 1));
    residual(14) = (y(16)) - (params(12)*y(6)+params(15)/400*x(it_, 3));
    residual(15) = (y(15)) - (params(13)*y(5)+params(16)/400*x(it_, 4));
    residual(16) = (y(14)) - (params(14)*y(4)+params(17)/400*x(it_, 2));

end
