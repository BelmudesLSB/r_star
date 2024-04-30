function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = rstar_afe_forecast.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(16, 1);
    residual(1) = (y(30)) - (params(11)+400*(y(18)-y(2)+y(24)));
    residual(2) = (y(31)) - (params(9)+400*y(20));
    residual(3) = (y(32)) - (params(9)+params(10)+400*y(22));
    residual(4) = (y(17)) - (y(33)-(y(22)-y(36)-y(28))*T(4));
    residual(5) = (y(26)) - (y(17)+(y(2)-y(11))*T(3)+params(1)*T(3)*(y(42)-y(26)*T(3)));
    residual(6) = (y(21)) - (y(22)-y(36));
    residual(7) = (y(19)) - (y(23)+params(1)*y(35)+params(3)*(y(26)*params(2)+y(17)*T(2)));
    residual(8) = (y(20)) - (y(19)+params(5)*y(4));
    residual(9) = (y(26)) - (y(18)-y(27));
    residual(10) = (y(28)) - (y(40)+y(41)-params(2)*(y(43)-y(27)));
    residual(11) = (y(29)) - (y(36)+y(28));
    residual(12) = (params(2)*y(27)+T(2)*(y(27)-y(11)*T(3))-T(3)*params(1)*T(2)*(y(43)-y(27)*T(3))) - ((params(1)*y(40)-y(24))*T(2)*T(3)+y(41)*params(1)*T(3)/(1-params(1)*T(3)));
    residual(13) = (y(22)) - (params(6)*y(6)+(1-params(6))*(y(20)*params(7)+y(26)*params(8)/4)+params(18)/400*x(1));
    residual(14) = (y(25)) - (params(12)*y(9)+params(15)/400*x(3));
    residual(15) = (y(24)) - (params(13)*y(8)+params(16)/400*x(4));
    residual(16) = (y(23)) - (params(14)*y(7)+params(17)/400*x(2));
end
