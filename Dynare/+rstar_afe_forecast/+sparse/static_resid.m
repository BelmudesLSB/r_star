function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = rstar_afe_forecast.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(16, 1);
    residual(1) = (y(14)) - (params(11)+400*y(8));
    residual(2) = (y(15)) - (params(9)+400*y(4));
    residual(3) = (y(16)) - (params(9)+params(10)+400*y(6));
    residual(4) = (y(1)) - (y(1)-(y(6)-y(4)-y(12))*T(4));
    residual(5) = (y(10)) - (y(1)+T(3)*(y(2)-y(11))+params(1)*T(3)*(y(10)-T(3)*y(10)));
    residual(6) = (y(5)) - (y(6)-y(4));
    residual(7) = (y(3)) - (y(7)+params(1)*y(3)+params(3)*(y(10)*params(2)+T(2)*y(1)));
    residual(8) = (y(4)) - (y(3)+y(4)*params(5));
    residual(9) = (y(10)) - (y(2)-y(11));
    residual(10) = (y(12)) - (y(8)+y(9));
    residual(11) = (y(13)) - (y(4)+y(12));
    residual(12) = (y(11)*params(2)+T(2)*(y(11)-T(3)*y(11))-(y(11)-T(3)*y(11))*T(3)*params(1)*T(2)) - ((params(1)*y(8)-y(8))*T(2)*T(3)+y(9)*params(1)*T(3)/(1-params(1)*T(3)));
    residual(13) = (y(6)) - (y(6)*params(6)+(1-params(6))*(y(4)*params(7)+y(10)*params(8)/4)+params(18)/400*x(1));
    residual(14) = (y(9)) - (y(9)*params(12)+params(15)/400*x(3));
    residual(15) = (y(8)) - (y(8)*params(13)+params(16)/400*x(4));
    residual(16) = (y(7)) - (y(7)*params(14)+params(17)/400*x(2));
end
