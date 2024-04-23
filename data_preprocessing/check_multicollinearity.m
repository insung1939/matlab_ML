% Check Multicollinearity Script

data_without_onehot = array2table(data_without_onehot);
data = [data_without_onehot, data(:, 29:end)];

n = width(data); % Number of predictors
    
% Initialize a vector to hold the VIF for each predictor
VIFs = zeros(1, n);

% Loop through each predictor
for i = 1:n
    % Define the current predictor as the response variable
    Y = data{:, i};
        
    % Define all other predictors as independent variables
    X = data{:, setdiff(1:n, i)};
        
    % Add a column of ones to X for the intercept
    X = [ones(size(X, 1), 1) X];
        
    % Fit the linear regression model
    lm = fitlm(X, Y);
    R2 = lm.Rsquared.Ordinary;
        
    % Calculate VIF
    VIFs(i) = 1 / (1 - R2);
end
    
% Display VIFs
disp('VIF for each predictor:');
disp(VIFs);
    
% Identify predictors with high multicollinearity
highVIFIndex = VIFs > 10; % Threshold for VIF
if any(highVIFIndex)
    disp('Predictors with VIF greater than 10:');
    disp(data.Properties.VariableNames(highVIFIndex));

     % Remove variables which are over 10 of VIF
    data = removevars(data, data.Properties.VariableNames(highVIFIndex));
else
    disp('No predictors with high multicollinearity found.');
end


% Check edited table 
disp('Modified data table after removing high VIF predictors:');
disp(data.Properties.VariableNames);
