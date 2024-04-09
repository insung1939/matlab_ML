% Dataset Load script

filename = 'household_energy_data.csv';

% csv file load using readtable
data = readtable(filename);

% Store target varible
target = data{:, 1};

% Store data including all features
data = data(:, 2:end);

% data size check
disp(size(data));
disp('Data Load Success!!!');