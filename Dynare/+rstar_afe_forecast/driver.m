%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'rstar_afe_forecast';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'ei'};
M_.exo_names_tex(1) = {'ei'};
M_.exo_names_long(1) = {'ei'};
M_.exo_names(2) = {'eu'};
M_.exo_names_tex(2) = {'eu'};
M_.exo_names_long(2) = {'eu'};
M_.exo_names(3) = {'edelta'};
M_.exo_names_tex(3) = {'edelta'};
M_.exo_names_long(3) = {'edelta'};
M_.exo_names(4) = {'egamma'};
M_.exo_names_tex(4) = {'egamma'};
M_.exo_names_long(4) = {'egamma'};
M_.endo_names = cell(16,1);
M_.endo_names_tex = cell(16,1);
M_.endo_names_long = cell(16,1);
M_.endo_names(1) = {'xtil'};
M_.endo_names_tex(1) = {'xtil'};
M_.endo_names_long(1) = {'xtil'};
M_.endo_names(2) = {'y'};
M_.endo_names_tex(2) = {'y'};
M_.endo_names_long(2) = {'y'};
M_.endo_names(3) = {'pitil'};
M_.endo_names_tex(3) = {'pitil'};
M_.endo_names_long(3) = {'pitil'};
M_.endo_names(4) = {'pi'};
M_.endo_names_tex(4) = {'pi'};
M_.endo_names_long(4) = {'pi'};
M_.endo_names(5) = {'r'};
M_.endo_names_tex(5) = {'r'};
M_.endo_names_long(5) = {'r'};
M_.endo_names(6) = {'i'};
M_.endo_names_tex(6) = {'i'};
M_.endo_names_long(6) = {'i'};
M_.endo_names(7) = {'u'};
M_.endo_names_tex(7) = {'u'};
M_.endo_names_long(7) = {'u'};
M_.endo_names(8) = {'gamma'};
M_.endo_names_tex(8) = {'gamma'};
M_.endo_names_long(8) = {'gamma'};
M_.endo_names(9) = {'delta'};
M_.endo_names_tex(9) = {'delta'};
M_.endo_names_long(9) = {'delta'};
M_.endo_names(10) = {'xe'};
M_.endo_names_tex(10) = {'xe'};
M_.endo_names_long(10) = {'xe'};
M_.endo_names(11) = {'ye'};
M_.endo_names_tex(11) = {'ye'};
M_.endo_names_long(11) = {'ye'};
M_.endo_names(12) = {'re'};
M_.endo_names_tex(12) = {'re'};
M_.endo_names_long(12) = {'re'};
M_.endo_names(13) = {'ie'};
M_.endo_names_tex(13) = {'ie'};
M_.endo_names_long(13) = {'ie'};
M_.endo_names(14) = {'gya'};
M_.endo_names_tex(14) = {'gya'};
M_.endo_names_long(14) = {'gya'};
M_.endo_names(15) = {'pia'};
M_.endo_names_tex(15) = {'pia'};
M_.endo_names_long(15) = {'pia'};
M_.endo_names(16) = {'iras'};
M_.endo_names_tex(16) = {'iras'};
M_.endo_names_long(16) = {'iras'};
M_.endo_partitions = struct();
M_.param_names = cell(18,1);
M_.param_names_tex = cell(18,1);
M_.param_names_long = cell(18,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'omega'};
M_.param_names_tex(2) = {'omega'};
M_.param_names_long(2) = {'omega'};
M_.param_names(3) = {'xi'};
M_.param_names_tex(3) = {'xi'};
M_.param_names_long(3) = {'xi'};
M_.param_names(4) = {'eta'};
M_.param_names_tex(4) = {'eta'};
M_.param_names_long(4) = {'eta'};
M_.param_names(5) = {'zeta'};
M_.param_names_tex(5) = {'zeta'};
M_.param_names_long(5) = {'zeta'};
M_.param_names(6) = {'rho'};
M_.param_names_tex(6) = {'rho'};
M_.param_names_long(6) = {'rho'};
M_.param_names(7) = {'phipi'};
M_.param_names_tex(7) = {'phipi'};
M_.param_names_long(7) = {'phipi'};
M_.param_names(8) = {'phix'};
M_.param_names_tex(8) = {'phix'};
M_.param_names_long(8) = {'phix'};
M_.param_names(9) = {'pistar'};
M_.param_names_tex(9) = {'pistar'};
M_.param_names_long(9) = {'pistar'};
M_.param_names(10) = {'ra'};
M_.param_names_tex(10) = {'ra'};
M_.param_names_long(10) = {'ra'};
M_.param_names(11) = {'gammaa'};
M_.param_names_tex(11) = {'gammaa'};
M_.param_names_long(11) = {'gammaa'};
M_.param_names(12) = {'rhodelta'};
M_.param_names_tex(12) = {'rhodelta'};
M_.param_names_long(12) = {'rhodelta'};
M_.param_names(13) = {'rhogamma'};
M_.param_names_tex(13) = {'rhogamma'};
M_.param_names_long(13) = {'rhogamma'};
M_.param_names(14) = {'rhou'};
M_.param_names_tex(14) = {'rhou'};
M_.param_names_long(14) = {'rhou'};
M_.param_names(15) = {'sigmadelta'};
M_.param_names_tex(15) = {'sigmadelta'};
M_.param_names_long(15) = {'sigmadelta'};
M_.param_names(16) = {'sigmagamma'};
M_.param_names_tex(16) = {'sigmagamma'};
M_.param_names_long(16) = {'sigmagamma'};
M_.param_names(17) = {'sigmau'};
M_.param_names_tex(17) = {'sigmau'};
M_.param_names_long(17) = {'sigmau'};
M_.param_names(18) = {'sigmai'};
M_.param_names_tex(18) = {'sigmai'};
M_.param_names_long(18) = {'sigmai'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 16;
M_.param_nbr = 18;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
options_.varobs = cell(3, 1);
options_.varobs(1)  = {'gya'};
options_.varobs(2)  = {'pia'};
options_.varobs(3)  = {'iras'};
options_.varobs_id = [ 14 15 16  ];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 16;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 8 24;
 1 9 0;
 0 10 25;
 2 11 26;
 0 12 0;
 3 13 0;
 4 14 0;
 5 15 27;
 6 16 28;
 0 17 29;
 7 18 30;
 0 19 0;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;]';
M_.nstatic = 6;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 4;
M_.nsfwrd   = 7;
M_.nspred   = 7;
M_.ndynamic   = 10;
M_.dynamic_tmp_nbr = [4; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'gya' ;
  2 , 'name' , 'pia' ;
  3 , 'name' , 'iras' ;
  4 , 'name' , 'xtil' ;
  5 , 'name' , 'xe' ;
  6 , 'name' , 'r' ;
  7 , 'name' , 'pitil' ;
  8 , 'name' , 'pi' ;
  9 , 'name' , '9' ;
  10 , 'name' , 're' ;
  11 , 'name' , 'ie' ;
  12 , 'name' , '12' ;
  13 , 'name' , 'i' ;
  14 , 'name' , 'delta' ;
  15 , 'name' , 'gamma' ;
  16 , 'name' , 'u' ;
};
M_.mapping.xtil.eqidx = [4 5 7 ];
M_.mapping.y.eqidx = [1 5 9 ];
M_.mapping.pitil.eqidx = [7 8 ];
M_.mapping.pi.eqidx = [2 4 6 8 11 13 ];
M_.mapping.r.eqidx = [6 ];
M_.mapping.i.eqidx = [3 4 6 13 ];
M_.mapping.u.eqidx = [7 16 ];
M_.mapping.gamma.eqidx = [1 10 12 15 ];
M_.mapping.delta.eqidx = [10 12 14 ];
M_.mapping.xe.eqidx = [5 7 9 13 ];
M_.mapping.ye.eqidx = [5 9 10 12 ];
M_.mapping.re.eqidx = [4 10 11 ];
M_.mapping.ie.eqidx = [11 ];
M_.mapping.gya.eqidx = [1 ];
M_.mapping.pia.eqidx = [2 ];
M_.mapping.iras.eqidx = [3 ];
M_.mapping.ei.eqidx = [13 ];
M_.mapping.eu.eqidx = [16 ];
M_.mapping.edelta.eqidx = [14 ];
M_.mapping.egamma.eqidx = [15 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 4 6 7 8 9 11 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(18, 1);
M_.endo_trends = struct('deflator', cell(16, 1), 'log_deflator', cell(16, 1), 'growth_factor', cell(16, 1), 'log_growth_factor', cell(16, 1));
M_.NNZDerivatives = [60; -1; -1; ];
M_.static_tmp_nbr = [4; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.9435;
omega = M_.params(2);
M_.params(3) = 0.0004;
xi = M_.params(3);
M_.params(4) = 0.7919;
eta = M_.params(4);
M_.params(5) = 0.4813;
zeta = M_.params(5);
M_.params(6) = 0.7969;
rho = M_.params(6);
M_.params(7) = 1.4414;
phipi = M_.params(7);
M_.params(8) = 0.5110;
phix = M_.params(8);
M_.params(9) = 2.2251;
pistar = M_.params(9);
M_.params(10) = 1.6378;
ra = M_.params(10);
M_.params(11) = 2.2555;
gammaa = M_.params(11);
M_.params(12) = 0.9665;
rhodelta = M_.params(12);
M_.params(13) = 0.7232;
rhogamma = M_.params(13);
M_.params(14) = 0.2108;
rhou = M_.params(14);
M_.params(15) = 1.0209;
sigmadelta = M_.params(15);
M_.params(16) = 1.8365;
sigmagamma = M_.params(16);
M_.params(17) = 0.4249;
sigmau = M_.params(17);
M_.params(18) = 0.34;
sigmai = M_.params(18);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
M_.Sigma_e(3, 3) = 1;
M_.Sigma_e(4, 4) = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 0;
options_.order = 1;
options_.periods = 0;
options_.graph_format = {'pdf'};
options_.conditional_variance_decomposition = [25;40;];
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
options_.datafile = 'data_EU_gdpd';
options_.parameter_set = 'calibration';
var_list_ = {};
options_.smoother = true;
options_.order = 1;
[oo_, M_, options_, bayestopt_] = evaluate_smoother(options_.parameter_set, var_list_, M_, oo_, options_, bayestopt_, estim_params_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rstar_afe_forecast_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
