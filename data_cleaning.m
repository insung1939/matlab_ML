% Data Cleaning Script (Data Pre_processing)

% 1. Convert all data to numerical values
run('./data_preprocessing/convert_numeric_columns.m');

% 2. Handle missing data
run('./data_preprocessing/handle_missing_data.m');

% 3. Handle outliers
run('./data_preprocessing/handle_outliers.m');

% 4. Check and handle multicollinearity
run('./data_preprocessing/check_multicollinearity.m');
 
% 5. Center and scale the data
run('./data_preprocessing/scaling_data.m');