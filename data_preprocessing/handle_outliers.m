% Handle Outliers Script

% 1. Histograms for each column

% Set the number of bins for the histograms
num_bins = 20;

% Calculate the number of rows and columns for subplots
num_cols = 4;  
num_rows = ceil(size(data, 2) / num_cols);

% Loop through each column and plot histogram
figure;
for i = 1:size(data, 2)
    subplot(num_rows, num_cols, i);
    histogram(data{:, i}, num_bins);
    title(sprintf('Column %d', i));
    xlabel('Value');
    ylabel('Frequency');
    grid on;
end

% 2. Check for inf values in each column 
% Replace inf values with column means
for i = 1:size(data, 2)
    inf_indices = isinf(data{:, i}); % Find indices of inf values
    if any(inf_indices)
        disp(['Column ', num2str(i), ' contains inf values.']);
        % Replace inf values with column mean
        column_data = data{:, i};
        column_data(inf_indices) = mean(column_data(~inf_indices), 'omitnan');
        data{:, i} = column_data; % Update column data
        disp(['Inf values in Column ', num2str(i), ' replaced with column mean.']);
    end
end

% 3. Detect outliers using Z-score, excluding one-hot encoded columns

% Exclude one-hot encoded columns (from 29th column to the end)
data_without_onehot = data{:, 1:28};

% Calculate Z-scores for each column
z_scores = zscore(data_without_onehot);

% Define threshold for outlier detection
threshold = 3; 

% Identify outliers
outliers = abs(z_scores) > threshold;

% Count outliers for each column
num_outliers = sum(outliers);

% Display number of outliers for each column
disp('Number of outliers for each column:');
disp(num_outliers);

% Replace outliers with column means
for i = 1:size(data_without_onehot, 2)
    column_data = data_without_onehot(:, i);
    column_mean = mean(column_data, 'omitnan'); % Calculate column mean
    outliers_col = outliers(:, i); % Get outliers for current column
    column_data(outliers_col) = column_mean; % Replace outliers with mean
    data_without_onehot(:, i) = column_data; % Update corrected data
end

disp('Outliers replaced with column means.');