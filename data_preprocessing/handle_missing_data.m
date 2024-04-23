% Handle Missing Data Script

% Check for missing data
missing_data = ismissing(data);

% Count missing values for each column
missing_per_column = sum(missing_data);

% Display the number of missing values for each column
disp('Number of missing values for each column:');
disp(missing_per_column);

% Replace missing values with column means
for i = 1:size(data, 2)
    if missing_per_column(i) > 0
        column_mean = mean(data{~missing_data(:, i), i});
        data{missing_data(:, i), i} = column_mean;
    end
end

disp('Missing values replaced with column means.'); % Display completion message

% Review
missing_data_after = ismissing(data);
if any(missing_data_after(:))
    disp('Missing data still detected after replacement.');
else
    disp('No missing data found after replacement.');
end
