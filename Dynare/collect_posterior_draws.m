%clear; clc;

fname = M_afe_.fname;

stock_keep_ie = [];
stock_keep_re = [];

if ctry == 21;
    MHfiles=20;
else
    MHfiles = 16;
end;

fprintf('\n *** Collecting Posterior Draws of Smoothed States ***\n');
for jj=1:MHfiles
fprintf('Loading %s \n', [fname '\metropolis\' fname '_smooth' num2str(jj) '.mat']);
load([fname '\metropolis\' fname '_smooth' num2str(jj) '.mat']);

stock_keep_ie = [stock_keep_ie squeeze(stock(13,:,:))];
stock_keep_re = [stock_keep_re squeeze(stock(12,:,:))];

end
%%
fprintf('\n Computing Posterior Moments of Smoothed States \n');

ie_p5 = prctile(stock_keep_ie',5);
ie_p95 = prctile(stock_keep_ie',95);

re_p5 = prctile(stock_keep_re',5);
re_p95 = prctile(stock_keep_re',95);
