% Data Cleaning Script (Data Pre_processing)

% 1. Convert all data to numerical values
run('./data_preprocessing/convert_numeric_columns.m');

% 2. Handle missing data
run('./data_preprocessing/handle_missing_data.m');

% 3. Handle outliers
% 대부분 데이터가 정규분포 따르지 않아서 z-score x.
run('./data_preprocessing/handle_outliers.m');

% 3.5 Check and handle multicollinearity
run('./data_preprocessing/check_multicollinearity.m');
 
% 4. Center and scale the data
run('./data_preprocessing/scaling_data.m');

% 5. Reduce dimension(PCA)
% run('./data_preprocessing/pca_data.m');