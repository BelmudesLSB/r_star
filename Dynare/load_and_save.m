clear all
clc

% Specify the file name
file_name_FFR = 'FEDFUNDS.xls';  
file_name_GDP = 'GDPC.xls';
file_name_DEF = 'PCEPILFE';

% Specify the range for data:
%fed_funds_range = 'B144:B290';
fed_funds_range = 'B144:B232';
%real_gdp_range = 'B174:B320';
real_gdp_range = 'B174:B262';
%deflator_range = 'B126:B272';
deflator_range = 'B126:B214';

% Read the FedFundRates data from the specified range in the Excel file
fed_funds = xlsread(file_name_FFR, fed_funds_range);
real_gdp = xlsread(file_name_GDP, real_gdp_range);
deflator = xlsread(file_name_DEF, deflator_range);

% Rename the column vectors
RGDP = real_gdp;
DGDP = deflator;
FFR = fed_funds;

% Calculate gya
gya = 400 * log(RGDP(2:end) ./ RGDP(1:end-1));
% Calculate pia
pia = 400 * log(DGDP(2:end) ./ DGDP(1:end-1));
% Rename FFR to iras
iras = FFR(2:end);

% Delete the old variables:
clear RGDP DGDP FFR;

% Save the variables as a .mat file
save('data_EU_gdpd.mat', 'gya', 'pia', 'iras');