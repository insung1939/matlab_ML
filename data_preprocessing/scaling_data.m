% Data Scaling Script: Standardization

% Standardized Data
mu = mean(data);
sigma = std(data);
standardizedData = (data - mu) ./ sigma;
standardizedData = table2array(standardizedData);
final_data = standardizedData;

disp('Data scaling completed')