clc; clear all; close all;

load('rstar_afe_forecast/Output/rstar_afe_forecast_results.mat');


oo_afe_=oo_;
exo_simul = zeros(40,4);
y2017(1)  = oo_afe_.SmoothedVariables.xtil(end);         %(1)
y2017(2)     = oo_afe_.SmoothedVariables.y(end);         %(2)
y2017(3) = oo_afe_.SmoothedVariables.pitil(end);         %(3)
y2017(4)    = oo_afe_.SmoothedVariables.pi(end);         %(4)
y2017(5)     = oo_afe_.SmoothedVariables.r(end);         %(5)
y2017(6)     = oo_afe_.SmoothedVariables.r(end);         %(6)
y2017(7)     = oo_afe_.SmoothedVariables.u(end);         %(7)
y2017(8) = oo_afe_.SmoothedVariables.gamma(end);         %(8)
y2017(9) = oo_afe_.SmoothedVariables.delta(end);         %(9)
y2017(10)    = oo_afe_.SmoothedVariables.xe(end);        %(10)
y2017(11)    = oo_afe_.SmoothedVariables.ye(end);        %(11)
y2017(12)    = oo_afe_.SmoothedVariables.re(end);        %(12) 
y2017(13)    = oo_afe_.SmoothedVariables.ie(end);        %(13)
y2017(14)   = oo_afe_.SmoothedVariables.gya(end);        %(14) Growth rate of output
y2017(15)   = oo_afe_.SmoothedVariables.pia(end);        %(15) Inflation rate
y2017(16)  = oo_afe_.SmoothedVariables.iras(end);        %(16) Shadow interest rate
y2017=y2017';
fcast2017 = simult_(y2017,oo_.dr,0*exo_simul,1);

re_us = 1*gammaa + oo_afe_.SmoothedVariables.re*400;
re_afe_forecast = [1*gammaa+400*fcast2017(12,2:end)'];

ie_afe_ss = gammaa + pistar;
ie_us = 1*ie_afe_ss + oo_afe_.SmoothedVariables.ie*400;
ie_afe_forecast = [1*ie_afe_ss+400*fcast2017(13,2:end)'];


longrun_rstar = zeros(size(oo_afe_.SmoothedVariables.r,1),1);
exo_simul = zeros(40,4);

for ii = 0:size(oo_afe_.SmoothedVariables.r,1)-1

y2017(1) = oo_afe_.SmoothedVariables.xtil(end-ii);
y2017(2) = oo_afe_.SmoothedVariables.y(end-ii);
y2017(3) = oo_afe_.SmoothedVariables.pitil(end-ii);
y2017(4) = oo_afe_.SmoothedVariables.pi(end-ii);
y2017(5) = oo_afe_.SmoothedVariables.r(end-ii);
y2017(6) = oo_afe_.SmoothedVariables.i(end-ii);
y2017(7) = oo_afe_.SmoothedVariables.u(end-ii);
y2017(8) = oo_afe_.SmoothedVariables.gamma(end-ii);
y2017(9) = oo_afe_.SmoothedVariables.delta(end-ii);
y2017(10) = oo_afe_.SmoothedVariables.xe(end-ii);
y2017(11) = oo_afe_.SmoothedVariables.ye(end-ii);
y2017(12) = oo_afe_.SmoothedVariables.re(end-ii);
y2017(13) = oo_afe_.SmoothedVariables.ie(end-ii);
y2017(14) = oo_afe_.SmoothedVariables.gya(end-ii);
y2017(15) = oo_afe_.SmoothedVariables.pia(end-ii);
y2017(16) = oo_afe_.SmoothedVariables.iras(end-ii);
%{
if ii==0
    y2017=y2017';
end
%}
% fcast_old = simult_(y2017,oo_.dr,0*oo_.exo_simul,1);
fcast_old = simult_(y2017,oo_.dr,0*exo_simul,1);
fcast_old = fcast_old';
longrun_rstar(end-ii) = 1*gammaa + 400*(fcast_old(41,12));

end