function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = rstar_afe_forecast.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(16, 34);
g1(1,1)=400;
g1(1,9)=(-400);
g1(1,15)=(-400);
g1(1,21)=1;
g1(2,11)=(-400);
g1(2,22)=1;
g1(3,13)=(-400);
g1(3,23)=1;
g1(4,8)=1;
g1(4,24)=(-1);
g1(4,26)=(-T(4));
g1(4,13)=T(4);
g1(4,19)=(-T(4));
g1(5,8)=(-1);
g1(5,1)=(-T(3));
g1(5,17)=1-params(1)*T(3)*(-T(3));
g1(5,29)=(-(params(1)*T(3)));
g1(5,7)=T(3);
g1(6,26)=1;
g1(6,12)=1;
g1(6,13)=(-1);
g1(7,8)=(-(params(3)*T(2)));
g1(7,10)=1;
g1(7,25)=(-params(1));
g1(7,14)=(-1);
g1(7,17)=(-(params(3)*params(2)));
g1(8,10)=(-1);
g1(8,2)=(-params(5));
g1(8,11)=1;
g1(9,9)=(-1);
g1(9,17)=1;
g1(9,18)=1;
g1(10,27)=(-1);
g1(10,28)=(-1);
g1(10,18)=(-params(2));
g1(10,30)=params(2);
g1(10,19)=1;
g1(11,26)=(-1);
g1(11,19)=(-1);
g1(11,20)=1;
g1(12,15)=T(2)*T(3);
g1(12,27)=(-(params(1)*T(2)*T(3)));
g1(12,28)=(-(params(1)*T(3)/(1-params(1)*T(3))));
g1(12,7)=T(2)*(-T(3));
g1(12,18)=params(2)+T(2)-T(3)*params(1)*T(2)*(-T(3));
g1(12,30)=(-(T(3)*params(1)*T(2)));
g1(13,11)=(-((1-params(6))*params(7)));
g1(13,3)=(-params(6));
g1(13,13)=1;
g1(13,17)=(-((1-params(6))*params(8)/4));
g1(13,31)=(-(params(18)/400));
g1(14,6)=(-params(12));
g1(14,16)=1;
g1(14,33)=(-(params(15)/400));
g1(15,5)=(-params(13));
g1(15,15)=1;
g1(15,34)=(-(params(16)/400));
g1(16,4)=(-params(14));
g1(16,14)=1;
g1(16,32)=(-(params(17)/400));

end
