%==========================================================================
% Dynare replication file for Curdia et al. (2015)
% "Has US Monetary Policy Tracked its Efficient Rate?"
% MD 06/15
%==========================================================================
global ctry smpl 

%--------------------------------------------------------------------------
% Model options
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% Declare variables / parameters
%--------------------------------------------------------------------------

% Endogenous variables
var
xtil        %(1)
y           %(2)
pitil       %(3)
pi          %(4)
r           %(5)
i           %(6)
u           %(7)
gamma       %(8)
delta       %(9)
xe          %(11)
ye          %(12)
re          %(13) 
ie          %(14)
gya         %(15) Growth rate of output
pia         %(16) Inflation rate
iras        %(17) Shadow interest rate
cyclical_rstar
;

% Exogenous variables
varexo
ei eu edelta egamma;

% Observed endogenous variables
varobs
gya pia iras;

% Parameters
parameters
beta omega xi eta zeta rho phipi phix pistar ra gammaa
rhodelta rhogamma rhou sigmadelta sigmagamma sigmau sigmai;

%--------------------------------------------------------------------------
% Set calibrated parameters and priors for estimated parameters
%--------------------------------------------------------------------------

% Calibrated parameters
beta = 0.99;

% Estimated parameters
estimated_params;
omega,      0.99,   gamma_pdf    , 1.0, 0.2;
xi,         0.002,  gamma_pdf    , 0.1, 0.05;
eta,        0.62,   beta_pdf     , 0.6, 0.2;
zeta,       0.48,   beta_pdf     , 0.6, 0.2;
rho,        0.75,   beta_pdf     , 0.7, 0.15;
phipi,      2,   normal_pdf   , 2, 0.01; % 1.75 0.25
phix,       0.6,   normal_pdf   , 0.6, 0.01;  % 0.5 0.1

% tight priors
 pistar, 2.06,    normal_pdf   , 2.0, 0.3;
 ra,     1.55,    normal_pdf   , 1.5, 0.3;

%pistar,     2.46,  normal_pdf   , 2.0, 1.0; % 2.46 2 1
%ra,         2.0,  normal_pdf   , 2.0, 1.0; % 2.0 2 1

gammaa,     1.75,  normal_pdf   , 2.0, 0.35;
rhodelta,   0.91,  beta_pdf     , 0.5, 0.2;
rhogamma,   0.55,  beta_pdf     , 0.5, 0.2;
rhou,       0.37,  beta_pdf     , 0.5, 0.2;
sigmadelta, 1.29,  inv_gamma_pdf, 0.5, 2.0;
sigmagamma, 1.88,  inv_gamma_pdf, 0.5, 2.0;
sigmau,     0.41,  inv_gamma_pdf, 0.5, 2.0;
sigmai,     0.33,  inv_gamma_pdf, 0.5, 2.0;
end;


%--------------------------------------------------------------------------
% Model
%--------------------------------------------------------------------------

model;

%% Auxiliary

#gam = gammaa/400;  % This is log(gamma)
#phigammatil = exp(gam)/(exp(gam)-beta*eta);
#etagammatil = exp(gam)/(exp(gam)-eta);
#phigamma = phigammatil*etagammatil;
#etagamma = eta/exp(gam);

%% Observation equations
gya  = gammaa + 400*(y - y(-1) + gamma);
pia  = pistar + 400*pi;
iras = (ra + pistar) + 400*i;

%% IS block

% (1) 
xtil = xtil(+1) - phigamma^(-1)*(i - pi(+1) - re);

% (2) Euler equation
xe   = etagamma*(y(-1) - ye(-1)) + beta*etagamma*(xe(+1) - etagamma*xe) + xtil;

% (3) Real rate
r    = i - pi(+1);

%% PC block

% (4)Philips curve
pitil = beta*pitil(+1) + xi*(omega*xe + phigamma*xtil) + u;

% (5) Inflation
pi    = zeta*pi(-1) + pitil;

%% Efficient rates
% (6) Efficient output gap
xe = y - ye;

% (7) Efficient real rate
re = gamma(+1) + delta(+1) - omega*(ye(+1)-ye);

ie = re + pi(+1);
% This equation seems to be wrong (PCB)
%phigamma*(ye - etagamma*(ye(-1) - gamma) + beta*etagamma*(ye(+1) + gamma(+1) - etagamma*ye)) = beta*etagamma/ (1-beta*etagamma)*delta(+1) - omega*ye;

% (8) Equilibrium equation in efficient model
omega*ye + phigamma*(ye - etagamma*ye(-1)) - beta*phigamma*etagamma*(ye(+1) - etagamma*ye) = phigamma*etagamma*(beta*gamma(+1) - gamma) + ((beta*etagamma)/(1-beta*etagamma))*delta(+1);

%% Policy rules
% (9) T: Taylor Rule
%i = rho*i(-1) + (1-rho)*(phipi*pi + phix/4*xe) + sigmai/400*ei;
% W: Wicksellian Rule
i = rho*i(-1) + (1-rho)*(re + phipi*pi) + sigmai/400*ei;
% T + W
%i = rho*i(-1) + (1-rho)*(re + phipi*pi + phix/4*xe) + sigmai/400*ei;

%% Shocks: (10) - (12)
delta = rhodelta*delta(-1) + sigmadelta/400*edelta;
gamma = rhogamma*gamma(-1) + sigmagamma/400*egamma;
u     = rhou*u(-1) + sigmau/400*eu;

cyclical_rstar = gammaa +400*re;
end;

%--------------------------------------------------------------------------
% Shocks
%--------------------------------------------------------------------------

shocks;
var egamma = 1;
var edelta = 1;
var ei     = 1;
var eu     = 1;
end;

%--------------------------------------------------------------------------
% Filtering
%--------------------------------------------------------------------------

load 'rstar_afe_shadow_gdpd_mean.mat' 'xparam1' 
load 'rstar_afe_shadow_gdpd_mean.mat' 'parameter_names' 

    for i = 1:length(xparam1)
        set_param_value(parameter_names{i}, xparam1(i));
    end;

stoch_simul(irf=40,order=1,periods=0,conditional_variance_decomposition=140,nograph,graph_format=pdf); 
load('data_EU_gdpd.mat');
calib_smoother(datafile=data_EU_gdpd);

oo_afe_=oo_;
M_afe_ = M_;
exo_simul = zeros(40,4);


longrun_rstar = zeros(size(oo_afe_.SmoothedVariables.r,1),1);

%y0(1)  = oo_afe_.SmoothedVariables.xtil(end);         %(1)
%y0(2)     = oo_afe_.SmoothedVariables.y(end);         %(2)
%y0(3) = oo_afe_.SmoothedVariables.pitil(end);         %(3)
%y0(4)    = oo_afe_.SmoothedVariables.pi(end);         %(4)
%y0(5)     = oo_afe_.SmoothedVariables.r(end);         %(5)
%y0(6)     = oo_afe_.SmoothedVariables.r(end);         %(6)
%y0(7)     = oo_afe_.SmoothedVariables.u(end);         %(7)
%y0(8) = oo_afe_.SmoothedVariables.gamma(end);         %(8)
%y0(9) = oo_afe_.SmoothedVariables.delta(end);         %(9)
%y0(10)    = oo_afe_.SmoothedVariables.xe(end);        %(10)
%y0(11)    = oo_afe_.SmoothedVariables.ye(end);        %(11)
%y0(12)    = oo_afe_.SmoothedVariables.re(end);        %(12) 
%y0(13)    = oo_afe_.SmoothedVariables.ie(end);        %(13)
%y0(14)   = oo_afe_.SmoothedVariables.gya(end);        %(14) Growth rate of output
%y0(15)   = oo_afe_.SmoothedVariables.pia(end);        %(15) Inflation rate
%y0(16)  = oo_afe_.SmoothedVariables.iras(end);        %(16) Shadow interest rate
%y0(17)  = oo_afe_.SmoothedVariables.cyclical_rstar(end);  %(17) Cyclical r*
%y0=y0';

% y2016 = M_.endo_histval;
%fcast2017 = simult_(y0,oo_.dr,0*exo_simul,1);


for ii = 0:size(oo_afe_.SmoothedVariables.r,1)-1
 
 y0(1) = oo_afe_.SmoothedVariables.xtil(end-ii);
 y0(2) = oo_afe_.SmoothedVariables.y(end-ii);
 y0(3) = oo_afe_.SmoothedVariables.pitil(end-ii);
 y0(4) = oo_afe_.SmoothedVariables.pi(end-ii);
 y0(5) = oo_afe_.SmoothedVariables.r(end-ii);
 y0(6) = oo_afe_.SmoothedVariables.i(end-ii);
 y0(7) = oo_afe_.SmoothedVariables.u(end-ii);
 y0(8) = oo_afe_.SmoothedVariables.gamma(end-ii);
 y0(9) = oo_afe_.SmoothedVariables.delta(end-ii);
 y0(10) = oo_afe_.SmoothedVariables.xe(end-ii);
 y0(11) = oo_afe_.SmoothedVariables.ye(end-ii);
 y0(12) = oo_afe_.SmoothedVariables.re(end-ii);
 y0(13) = oo_afe_.SmoothedVariables.ie(end-ii);
 y0(14) = oo_afe_.SmoothedVariables.gya(end-ii);
 y0(15) = oo_afe_.SmoothedVariables.pia(end-ii);
 y0(16) = oo_afe_.SmoothedVariables.iras(end-ii);
 y0(17) = oo_afe_.SmoothedVariables.cyclical_rstar(end-ii);
 
if ii==0
    y0=y0';
end
 fcast_old = simult_(y0,oo_.dr,0*exo_simul,1);
 fcast_old = fcast_old';
 longrun_rstar(end-ii) = 1*gammaa + 400*(fcast_old(41,12));
 end
oo_afe_.SmoothedVariables.longrun_rstar = longrun_rstar;

%--------------------------------------------------------------------------
% Post-estimation
%--------------------------------------------------------------------------



%--------------------------------------------------------------------------
% Clean files and store results
%--------------------------------------------------------------------------



