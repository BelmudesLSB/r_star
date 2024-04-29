load 'rstar_afe_shadow_rates_gdpd_1.mat';
fnametitle = 'AFE: GDP DEF Model';
    
set_param_value('omega',oo_afe_.posterior_mean.parameters.omega);
set_param_value('xi',oo_afe_.posterior_mean.parameters.xi);
set_param_value('eta',oo_afe_.posterior_mean.parameters.eta);
set_param_value('zeta',oo_afe_.posterior_mean.parameters.zeta);
set_param_value('rho',oo_afe_.posterior_mean.parameters.rho);
set_param_value('phipi',oo_afe_.posterior_mean.parameters.phipi);
set_param_value('phix',oo_afe_.posterior_mean.parameters.phix);
set_param_value('pistar',oo_afe_.posterior_mean.parameters.pistar);
set_param_value('ra',oo_afe_.posterior_mean.parameters.ra);
set_param_value('gammaa',oo_afe_.posterior_mean.parameters.gammaa);
set_param_value('rhodelta',oo_afe_.posterior_mean.parameters.rhodelta);
set_param_value('rhogamma',oo_afe_.posterior_mean.parameters.rhogamma);
set_param_value('rhou',oo_afe_.posterior_mean.parameters.rhou);
set_param_value('sigmadelta',oo_afe_.posterior_mean.parameters.sigmadelta);
set_param_value('sigmagamma',oo_afe_.posterior_mean.parameters.sigmagamma);
set_param_value('sigmau',oo_afe_.posterior_mean.parameters.sigmau);
set_param_value('sigmai',oo_afe_.posterior_mean.parameters.sigmai);


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

y2016(1)  = oo_afe_.SmoothedVariables.xtil(end-3);         %(1)
y2016(2)     = oo_afe_.SmoothedVariables.y(end-3);         %(2)
y2016(3) = oo_afe_.SmoothedVariables.pitil(end-3);         %(3)
y2016(4)    = oo_afe_.SmoothedVariables.pi(end-3);         %(4)
y2016(5)     = oo_afe_.SmoothedVariables.r(end-3);         %(5)
y2016(6)     = oo_afe_.SmoothedVariables.r(end-3);         %(6)
y2016(7)     = oo_afe_.SmoothedVariables.u(end-3);         %(7)
y2016(8) = oo_afe_.SmoothedVariables.gamma(end-3);         %(8)
y2016(9) = oo_afe_.SmoothedVariables.delta(end-3);         %(9)
y2016(10)    = oo_afe_.SmoothedVariables.xe(end-3);        %(10)
y2016(11)    = oo_afe_.SmoothedVariables.ye(end-3);        %(11)
y2016(12)    = oo_afe_.SmoothedVariables.re(end-3);        %(12) 
y2016(13)    = oo_afe_.SmoothedVariables.ie(end-3);        %(13)
y2016(14)   = oo_afe_.SmoothedVariables.gya(end-3);        %(14) Growth rate of output
y2016(15)   = oo_afe_.SmoothedVariables.pia(end-3);        %(15) Inflation rate
y2016(16)  = oo_afe_.SmoothedVariables.iras(end-3);        %(16) Shadow interest rate


