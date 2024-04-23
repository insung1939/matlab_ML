% Convert categorical columns to numeric columns

% Check if all columns are numeric or not.
nonNumericColumns = {};

for i = 1:width(data)
    % Check the data type of the current column
    currentColumnType = class(data{:, i});
    
    % Add non-numeric column to nonNumericColumns
    if ~ismember(currentColumnType, {'double', 'single', 'int8', 'uint8', 'int16', 'uint16', 'int32', 'uint32', 'int64', 'uint64'})
        nonNumericColumns{end+1} = data.Properties.VariableNames{i};
    end
end


% Transform columns which are not numeric using one hot encoding

for i = 1:length(nonNumericColumns)
    % Get the current column name
    columnName = nonNumericColumns{i};
    
    % Transform the current column to a categorical column
    categoricalColumn = categorical(data.(columnName));
    % Get the category names for the current column
    categoryNames = categories(categoricalColumn);
    
    % Transform the categorical column to one-hot-encoding
    ohc = onehotencode(categoricalColumn, 2);
    
    % Add new data to the original data
    for j = 1:size(ohc, 2)
        % Get the new column name
        newColName = sprintf('%s_%s', columnName,categoryNames{j});
        data.(newColName) = ohc(:, j);
    end
    
    % Delete the column which is not numeric.
    data.(columnName) = [];
end

disp('Conversion completed. Non-numeric columns have been one-hot encoded.'); % Display completion message
