clear all
clc

full_sample = true;

% Specify the file name
file_name_FFR = 'FEDFUNDS.xls';  
file_name_GDP = 'GDPC.xls';
file_name_DEF = 'PCEPILFE';

% Specify the range for data:
if full_sample
    fed_funds_range = 'B144:B290';
    real_gdp_range = 'B174:B320';
    deflator_range = 'B126:B272';
else 
    fed_funds_range = 'B144:B232';
    real_gdp_range = 'B174:B262';
    deflator_range = 'B126:B214';
end

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

dynare rstar_afe_forecast.mod

re_data = oo_.SmoothedVariables.re;

% Create a time vector corresponding to the quarters from 1987q3 to 2009q3

if full_sample
    start_year = 1987;
    start_quarter = 3;
    end_year = 2024;
    end_quarter = 1;
    quarters_total = 146;
    time = linspace(datenum(start_year, start_quarter*3, 1), datenum(end_year, end_quarter*3, 1), quarters_total);
       
    % Create a figure and specify its position and background color
    fig = figure;
    fig.Position = [100, 100, 800, 600]; % [left, bottom, width, height]
    fig.Color = 'white'; % Set background color to white
    
    % Create axes and plot on them
    axes('Position', [0.15, 0.1, 0.75, 0.8]); % [left, bottom, width, height]
    plot(time, (re_data-mean(re_data))*400, 'r-.', 'LineWidth', 1.5, 'DisplayName', 'T') % Red dash-dot line with label "T"
    hold on
    plot(time, (iras-mean(iras)), 'b-', 'LineWidth', 1.5, 'DisplayName', 'FFR') % Blue solid line with label "FFR"
    hold on
    plot(time, 0*iras, 'LineWidth', 0.5, 'Color', 'black', 'HandleVisibility', 'off') % Black zero line without legend entry
    hold off
    datetick('x', 'yyyy:qq'); % Display years and quarters
    
    % Set y-axis limits
    ylim([-25, 12]);
    
    % Add legend with northeast location
    legend('Location', 'southwest');
    
    % Add labels and title
    xlabel('Time');
    ylabel('Smoothed efficient real rate');
    saveas(gcf, 'r_star_full_sample.png');
else

    start_year = 1987;
    start_quarter = 3;
    end_year = 2009;
    end_quarter = 3;
    quarters_total = 88;
    time = linspace(datenum(start_year, start_quarter*3, 1), datenum(end_year, end_quarter*3, 1), quarters_total);
    
    % Create a figure and specify its position and background color
    fig = figure;
    fig.Position = [100, 100, 800, 600]; % [left, bottom, width, height]
    fig.Color = 'white'; % Set background color to white
    
    % Create axes and plot on them
    axes('Position', [0.15, 0.1, 0.75, 0.8]); % [left, bottom, width, height]
    plot(time, (re_data-mean(re_data))*400, 'r-.', 'LineWidth', 1.5, 'DisplayName', 'T') % Red dash-dot line with label "T"
    hold on
    plot(time, (iras-mean(iras)), 'b-', 'LineWidth', 1.5, 'DisplayName', 'FFR') % Blue solid line with label "FFR"
    hold on
    plot(time, 0*iras, 'LineWidth', 0.5, 'Color', 'black', 'HandleVisibility', 'off') % Black zero line without legend entry
    hold off
    datetick('x', 'yyyy:qq'); % Display years and quarters
    
    % Set y-axis limits
    ylim([-12, 8]);
    
    % Add legend with northeast location
    legend('Location', 'northeast');
    
    % Add labels and title
    xlabel('Time');
    ylabel('Smoothed efficient real rate');
    saveas(gcf, 'r_star_benchmark.png');
end
