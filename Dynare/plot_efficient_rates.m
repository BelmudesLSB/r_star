% Assuming oo_.SmoothedVariables.re contains the data you want to plot
re_data = oo_.SmoothedVariables.re;

% Create a time vector corresponding to the quarters from 1987q3 to 2009q3
start_year = 1987;
start_quarter = 3;
end_year = 2009;
end_quarter = 3;
quarters_total = 88;
time = linspace(datenum(start_year, start_quarter*3, 1), datenum(end_year, end_quarter*3, 1), quarters_total);

% Plot the data
%plot(time, re_data, 'LineWidth', 1.5); % Adjust line width as needed

plot(time, (re_data-mean(re_data))*400)
hold on
plot(time, (iras-mean(iras)))
% Format the x-axis to show quarters
datetick('x', 'yyyy:qq'); % Display years and quarters

% Add labels and title
xlabel('Time');
ylabel('Re');
title('Plot of oo_.SmoothedVariables.re');
