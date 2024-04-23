% Dataset Load Script

filename = 'household_energy_data.csv'; % File name of the dataset

% Load the csv file using readtable
data = readtable(filename);

% Store the target variable
target = data{:, 1};

% Store the data including all features
data = data(:, 2:end);

% Check the size of the data
disp(size(data));
disp('Data Load Success!!!'); % Display success message for data loading
