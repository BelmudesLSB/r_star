clear all 
% Specify the file name and sheet name
filename = 'Data_r_star.xlsx';
sheet = 'Sheet1';

% Read the data from the Excel file
[num, txt, raw] = xlsread(filename, sheet);

% Extract the RGDP, IRAS, and DGDP data from the raw cell array
RGDP = cell2mat(raw(2:end, 2)); % Assuming RGDP data is in the second column starting from the second row
iras = cell2mat(raw(2:end-1, 3)); % Assuming IRAS data is in the third column starting from the second row
DGDP = cell2mat(raw(2:end, 4)); % Assuming DGDP data is in the fourth column starting from the second row

% Calculate the gya series for RGDP
gya = 400 * log(RGDP(2:end) ./ RGDP(1:end-1));
% Calculate the pia series for IRAS
pia = 400 * log(DGDP(2:end) ./ DGDP(1:end-1));

% Save gya, IRAS, and pia to a MAT file
save('data_EU_gdpd.mat', 'gya', 'iras', 'pia');